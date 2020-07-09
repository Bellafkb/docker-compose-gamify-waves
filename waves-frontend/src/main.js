import { WidgetTopNavigation, WidgetBottomNavigation } from 'vca-widget-navigation'
import enElement from 'element-ui/lib/locale/lang/en';
import deElement from 'element-ui/lib/locale/lang/de';
import * as VueGoogleMaps from 'vue2-google-maps'
import Vue from 'vue'
import App from './App.vue'
import ElementUI from 'element-ui';
import router from './router'
import VueI18n from 'vue-i18n'
import en from '@/lang/en_US.json';
import de from '@/lang/de_DE.json';
import {store} from './store'
import vsm from 'vue-state-machine';
import VueQuill from "vue-quill";
import 'element-ui/lib/theme-chalk/index.css';






// vsm requires a reference to a vuex store
Vue.use(vsm.plugin, store)
Vue.use(VueQuill)


Vue.use(VueGoogleMaps, {
  load: {
    key: 'AIzaSyDnoNOeMPDa7WkC8NVxO6IZV3K6MRNLA0M',
  },
})

const dateTimeFormats = {
  'en-US': {
    short: {
      year: 'numeric', month: 'short', day: 'numeric'
    },
    long: {
      year: 'numeric', month: 'short', day: 'numeric',
      weekday: 'short', hour: 'numeric', minute: 'numeric'
    }
  },
  'de-DE': {
    short: {
      year: 'numeric', month: 'short', day: 'numeric'
    },
    long: {
      year: 'numeric', month: 'short', day: 'numeric',
      weekday: 'short', hour: 'numeric', minute: 'numeric', hour12: true
    }
  }
}

Vue.use(VueI18n);

const locale = navigator.language;
const i18n = new VueI18n({
  locale: locale,
  dateTimeFormats,
  messages: {
    'en-US': Object.assign(en, enElement),
    'de-DE': Object.assign(de, deElement),
    'de': Object.assign(de, deElement),
    'en': Object.assign(en, enElement)
  }
});

Vue.use(ElementUI, {
  i18n: (key, value) => i18n.t(key, value)
});

Vue.use(WidgetBottomNavigation, { 'i18n': i18n })
Vue.use(WidgetTopNavigation, { 'i18n': i18n })

new Vue({
  router,
  store,
  i18n,
  render: h => h(App)
}).$mount('#app')