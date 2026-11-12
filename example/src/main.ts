import { createApp } from 'vue';
import { IonicVue } from '@ionic/vue';
import '@ionic/vue/css/core.css';
import App from './App.vue';

const app = createApp(App).use(IonicVue);

app.mount('#app');
