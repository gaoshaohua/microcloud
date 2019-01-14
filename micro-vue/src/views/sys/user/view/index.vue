<template>
    <div style="text-align: left">
      <el-form :inline="true" label-width="120px">
        <el-form-item label="用户名：">
          <div class="item-content">{{rowData.username}}</div>
        </el-form-item>
        <el-form-item label="用户姓名：">
          <div class="item-content">{{rowData.name}}</div>
        </el-form-item>
        <el-form-item label="用户昵称：">
          <div class="item-content">{{rowData.nickname}}</div>
        </el-form-item>
        <el-form-item label="联系电话：">
          <div class="item-content">{{rowData.phone}}</div>
        </el-form-item>
        <el-form-item label="邮箱：">
          <div class="item-content">{{rowData.email}}</div>
        </el-form-item>
        <el-form-item label="性别：">
          <div class="item-content">{{rowData.geneder}}</div>
        </el-form-item>
        <el-form-item label="最后登录时间：">
          <div class="item-content">{{rowData.loginDate}}</div>
        </el-form-item>
        <el-form-item label="登录IP：">
          <div class="item-content">{{rowData.loginIp}}</div>
        </el-form-item>
      </el-form>
      <div style="text-align: center">
        <slot name="footer">
          <el-button type="primary" @click="$emit('close')">关闭</el-button>
        </slot>
      </div>
    </div>
</template>

<script>
import store from '@/views/sys/user/view/store/index.js'
import { mapState, mapMutations, mapActions } from 'vuex'

const storeName = 'userViewStore'
const data = () => {
  return {

  }
}
const computed = {
  ...mapState(storeName, [])
}

const methods = {
  ...mapMutations(storeName, []),
  ...mapActions(storeName, [])
}
export default {
  name: 'userView',
  components: {

  },
  beforeCreate: function () {
    this.$store.registerModule(storeName, store)
  },
  destroyed: function () {
    this.$store.unregisterModule(storeName)
  },
  mounted: function () {
  },
  props: ['rowData'],
  data: data,
  computed: computed,
  methods: methods
}
</script>

<style scoped>
  .item-content {
    width: 150px;
    text-align: left;
  }
</style>
