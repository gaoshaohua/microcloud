<template>
  <div id="app">
    <base-layout>
      <template slot="aside">
        <Aside></Aside>
      </template>
    </base-layout>
  </div>
</template>

<script>
import BaseLayout from '@/components/layout/BaseLayout.vue'
import Aside from '@/components/aside/index.vue'

export default {
  name: 'app',
  components: {
    BaseLayout,
    Aside
  }
}

</script>

