<template>
  <el-menu id="aside" :default-openeds="['1']" router>
    <el-submenu v-for="item in menuTreeData" :key="item.id" :index="item.name">
      <template slot="title"><i class="el-icon-message"></i>{{item.name}}</template>
      <el-menu-item v-for="child in item.childers" :key="child.id" :index="child.url">
        {{child.name}}
      </el-menu-item>
    </el-submenu>
  </el-menu>
</template>

<script>
import { mapState, mapMutations, mapActions } from 'vuex'
import store from '@/components/aside/store/store.js'

let storeName = 'asideStore'

const data = () => {
  return {
    title: ''
  }
}

const computed = {
  incre () {
    return 1
  },
  ...mapState(storeName, ['menuTreeData'])
}

const menthods = {
  clickMenu () { // 点击菜单叶子节点

  },
  ...mapMutations(storeName, ['setMenuTreeData']),
  ...mapActions(storeName, ['getMenuTreeData'])
}

export default {
  name: 'Aside',
  beforeCreate: function () {
    // 动态注册store
    this.$store.registerModule(storeName, store)
  },
  destroyed: function () {
    // 动态卸载store
    this.$store.unregisterModule(storeName)
  },
  data: data,
  computed: computed,
  menthods: menthods
}
</script>

<style scoped>
  #aside {
    border-style: none;
  }
</style>
