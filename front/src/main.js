import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import axios from 'axios';

const app = createApp(App).use(router);

const axiosConfigInstanceAuth = axios.create({
    baseURL: process.env.VUE_APP_API_GOTIME_BASEPATH,
    headers: {
      'APIKEY-Gotime': process.env.VUE_APP_GOTIME_APIKEY,
    },
  });
  const axiosConfigInstance = axios.create({
    baseURL: process.env.VUE_APP_API_GOTIME_BASEPATH,
  });
  
app.config.globalProperties.$axiosConfigInstanceAuth = axiosConfigInstanceAuth;
app.config.globalProperties.$axiosConfigInstance = axiosConfigInstance;
    
app.mount('body');
