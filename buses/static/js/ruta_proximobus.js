const { ref, onMounted, onBeforeUnmount } = Vue;

ruta_app.component("proximobus", {
  props: ["route_short_name"],
  setup() {
    // Reactive data
    const desde_sanjose = ref(["-", "-", "-"]); // Horas
    const hacia_sanjose = ref(["-", "-", "-"]);
    const desde_sanjose_ramal = ref([]); // Ramales
    const hacia_sanjose_ramal = ref([]);

    // Store interval reference for cleanup
    let intervalId = null;

    // Methods
    const is_badge_visible = (ramal) => {
      // Es visible si ramal tiene un valor y no es "SG"
      if (ramal && ramal != "SG") return true;
      return false;
    };

    const badgeClassMap = {
      SG: "invisible",
      AC: "badge-secondary",
      SL: "fondo-color-sanluis",
      TU: "fondo-color-turrujal",
      JO: "badge-secondary",
    };

    const filter_badge = (ramal) => {
      return badgeClassMap[ramal] || "";
    };

    // Function to update the next bus times
    const updateProximoBus = () => {
      desde_sanjose.value = [];
      desde_sanjose_ramal.value = [];
      let time = new Date();
      let time_to_minutes = time.getMinutes() + time.getHours() * 60;

      horario_desde_sanjose
        .filter((value) => value[0] > time_to_minutes) // Mayores a la hora
        .slice(0, 3) // Los siguientes 3
        .forEach((element, index) => {
          time.setHours(element[1]);
          time.setMinutes(element[2]);
          desde_sanjose.value[index] = time.toLocaleString("en-US", {
            hour: "numeric",
            minute: "numeric",
            hour12: true,
          });
          desde_sanjose_ramal.value[index] = element[3]; // Ramal
        });

      hacia_sanjose.value = [];
      hacia_sanjose_ramal.value = [];
      horario_hacia_sanjose
        .filter((value) => value[0] > time_to_minutes) // Mayores a la hora
        .slice(0, 3) // Los siguientes 3
        .forEach((element, index) => {
          time.setHours(element[1]);
          time.setMinutes(element[2]);
          hacia_sanjose.value[index] = time.toLocaleString("en-US", {
            hour: "numeric",
            minute: "numeric",
            hour12: true,
          });
          hacia_sanjose_ramal.value[index] = element[3]; // Ramal
        });
    };

    // Lifecycle hooks
    onMounted(() => {
      updateProximoBus();
      intervalId = setInterval(() => {
        updateProximoBus();
      }, 60000); // Cada minuto refresca
    });

    onBeforeUnmount(() => {
      if (intervalId) {
        clearInterval(intervalId);
      }
    });

    // Return all reactive data and methods that template needs
    return {
      desde_sanjose,
      hacia_sanjose,
      desde_sanjose_ramal,
      hacia_sanjose_ramal,
      is_badge_visible,
      filter_badge,
    };
  },
  template: `
<table class="table table-light">

<thead class="lead">
    <th>
        {{ route_short_name }}
    </th>
    <th>
        San&nbsp;José
    </th>
</thead>

<tbody>
    <!-- Primera fila -->
    <tr class="lead">
        <td v-if="hacia_sanjose[0]">
            <span class="align-middle">{{ hacia_sanjose[0] }}</span>&nbsp;
            <span v-if="is_badge_visible(hacia_sanjose_ramal[0])"
                :class="['badge', 'custom-badge',
                filter_badge(hacia_sanjose_ramal[0])
                ]">{{ hacia_sanjose_ramal[0] }}</span>
        </td>
        <td v-else>No hay más buses hoy</td>

        <td v-if="desde_sanjose[0]">
            <span class="align-middle">{{ desde_sanjose[0] }}</span>&nbsp;
            <span v-if="is_badge_visible(desde_sanjose_ramal[0])"
                :class="['badge', 'custom-badge',
                filter_badge(desde_sanjose_ramal[0])
                ]">{{ desde_sanjose_ramal[0] }}</span>
        </td>
        <td v-else>No hay más buses hoy</td>
    </tr>

    <!-- Segunda fila -->
    <tr>
        <td>
            <span v-if="hacia_sanjose[1]" class="align-middle">{{ hacia_sanjose[1] }}</span>&nbsp;
            <span v-if="is_badge_visible(hacia_sanjose_ramal[1])"
                :class="['badge', 'custom-badge',
                filter_badge(hacia_sanjose_ramal[1])
                ]">{{ hacia_sanjose_ramal[1] }}</span>
        </td>
        <td>
            <span v-if="desde_sanjose[1]" class="align-middle">{{ desde_sanjose[1] }}</span>&nbsp;
            <span v-if="is_badge_visible(desde_sanjose_ramal[1])"
                :class="['badge', 'custom-badge',
                filter_badge(desde_sanjose_ramal[1])
                ]">{{ desde_sanjose_ramal[1] }}</span>
        </td>
    </tr>

    <!-- Tercera fila -->
    <tr>
        <td>
            <span v-if="hacia_sanjose[2]" class="align-middle">{{ hacia_sanjose[2] }}</span>&nbsp;
            <span v-if="is_badge_visible(hacia_sanjose_ramal[2])"
                :class="['badge', 'custom-badge',
                filter_badge(hacia_sanjose_ramal[2])
                ]">{{ hacia_sanjose_ramal[2] }}</span>
        </td>
        <td>
            <span v-if="desde_sanjose[2]" class="align-middle">{{ desde_sanjose[2] }}</span>&nbsp;
            <span v-if="is_badge_visible(desde_sanjose_ramal[2])"
                :class="['badge', 'custom-badge',
                filter_badge(desde_sanjose_ramal[2])
                ]">{{ desde_sanjose_ramal[2] }}</span>
        </td>
    </tr>
</tbody>
</table>
`,
});
