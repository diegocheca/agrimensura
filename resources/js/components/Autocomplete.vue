<template>
  <v-autocomplete :items="items" v-model="item" :get-label="getLabel" :component-item='template' @update-items="updateItems">
  </v-autocomplete>
</template>

<script>
import Autocomplete from 'v-autocomplete'
import ItemTemplate from './ItemTemplate.vue'

// You need a specific loader for CSS files like https://github.com/webpack/css-loader
//import 'v-autocomplete/dist/v-autocomplete.css'

export default {
    components: {
        'v-autocomplete': Autocomplete},
  data () {
    return {
      item: {id: 9, name: 'Lion', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'},
      items: [
        {id: 1, name: 'Lion', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'},
        {id: 2, name: 'caballo', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'},
        {id: 3, name: 'pez', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'},
        {id: 4, name: 'Tiburon', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'},
        {id: 5, name: 'Calamar', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'}

      ],
      template: ItemTemplate
    }
  },
  methods: {
    getLabel (item) {
      return item.name
    },
    updateItems (text) {
      yourGetItemsMethod(text).then( (response) => {
        this.items = response
      })
    }
  }
}
</script>

<style>
.v-autocomplete{position:relative}.v-autocomplete .v-autocomplete-list{position:absolute}.v-autocomplete .v-autocomplete-list .v-autocomplete-list-item{cursor:pointer}.v-autocomplete .v-autocomplete-list .v-autocomplete-list-item.v-autocomplete-item-active{background-color:#f3f6fa}
</style>
