require('./bootstrap');
window.Vue = require('vue');

Vue.component('vue-example-name',require('./components/VueExample.vue').default);

const app = new Vue({
    el: '#app',
});