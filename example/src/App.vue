<script setup lang="ts">
import {
  IonApp,
  IonContent,
  IonHeader,
  IonPage,
  IonTitle,
  IonToolbar,
} from '@ionic/vue';

const titulo = 'Validación Base Node + pnpm + Ionic + Vue 3';
</script>

<template>
  <ion-app>
    <ion-page>
      <ion-header>
        <ion-toolbar>
          <ion-title>{{ titulo }}</ion-title>
        </ion-toolbar>
      </ion-header>
      <ion-content class="ion-padding">
        <main>
          <h1>Entorno verificado correctamente</h1>
          <p>Compilación de prueba ejecutada antes de publicar la imagen Docker.</p>
        </main>
      </ion-content>
    </ion-page>
  </ion-app>
</template>
