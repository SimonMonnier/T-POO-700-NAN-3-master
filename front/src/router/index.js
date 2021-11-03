import { createRouter, createWebHistory } from 'vue-router'

const accueil = () => import('../views/Homepage.vue')
const dashboard = () => import('../views/Dashboard.vue')
const utilisateurs = () => import('../views/UsersList.vue')
const heuresDeTravail = () => import('../views/WorkingTimes.vue')
const tests = () => import('../views/Tests.vue')

const routes = [
  {
    path: '/',
    name: 'Bienvenue',
    component: accueil,
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: dashboard,
  },
  {
    path: '/utilisateurs',
    name: 'Utilisateurs',
    component: utilisateurs,
  },
  {
    path: '/heures-de-travail',
    name: 'Heures de travail',
    component: heuresDeTravail,
  },
  {
    path: '/heures-de-travail/:userid',
    name: 'Heures de travail utilisateur',
    component: heuresDeTravail,
  },
  {
    path: '/tests',
    name: 'Tests',
    component: tests,
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

export default router
