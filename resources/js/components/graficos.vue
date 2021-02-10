<template>
  <div class="small">
    <h4>Reportes del Venta Junio</h4>
    <line-chart :chart-data="datacollection" :height="100"></line-chart>
  </div>
</template>

<script>

import LineChart from './LineChart.js'

export default {
  components: {
    LineChart
  },
  data(){
    return {
      datacollection: null
    }
  },
  mounted () {
    this.fillData()
  },
  methods: {

    fillData ()
    {
      this.datacollection = {
        labels: ['Lunes','Martes','Miercoles','Jueves','Viernes', 'Sabado' , 'Domingo'],
        datasets: [
          {
            label: 'Ventas',
            backgroundColor: '#FF0066',
            data: [ 20, 40, 50, 20, 50, 40, 250]
          },
          {
            label: 'Compras',
            backgroundColor: '#22BBD0',
            data: [40, 20, 80, 60, 10, 15, 90]
          },
        ]
      }
    }
  }
}
</script>

<style lang="css">
.small {
  max-width: 800px;
  /* max-height: 500px; */
  margin:  50px auto;
}
</style>