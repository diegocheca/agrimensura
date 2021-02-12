<template>
    <div>
        <label for="buscar">Buscador Online :</label>
        <input type="text" id="buscar" name="buscar" v-model="keywords">
        <ul v-if="filteredResults.length > 0">
            <li v-for="result in filteredResults" :key="result.id" v-text="result.numero_expediente"></li>
        </ul>
    </div>
</template>
<script>
 export default{
  watch: {
  },
  data() {
    return {
      keywords: null,
      results: []
    };
  },
  mounted() {
      this.buscar_expedientes_buscador();
  },
  /*computed: {
    filteredResults () {
        return this.results.filter()

        /*

      return this.keywords ? 
      this.results.filter(row => row.numero_expediente.search(new RegExp(`${this.keywords}`, 'i')) !== -1) 
      : this.results
      */

      /*return this.results.filter(item => {
         return item.numero_expediente.indexOf(this.keywords()) > -1
      })*
    }*/
    computed: {
        filteredItems: function() {
            return this.$results.numero_expediente.filter(function(item) {
                return item.indexOf(this.keywords) != -1;
            }.bind(this));
        }
    },
  methods: {
      buscar_expedientes_buscador(){
            axios.get('/datos_expedientes_para_buscador/').then(res=>{
                this.results = res.data;
                console.log('mis expedeintes son:\n');
                console.log(this.results);
            });
      }

      

  }
 }
</script>