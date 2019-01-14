<template>
  <div v-loading="loading">
    <div id="breadcrumb">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>系统管理</el-breadcrumb-item>
        <el-breadcrumb-item>用户管理</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <hr>
    <div id="search">
      <el-form ref="searchForm" :model="searchFormData" :rules="rules" :inline="true" size="small" label-width="80px">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="searchFormData.username"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="queryForm()">查询</el-button>
          <el-button @click="resetForm()">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div id="content">
      <el-button type="primary" @click="add()">添加</el-button>
      <el-table
        size="mini"
        :data="tableData"
        max-height="350"
        border
        :stripe="true"
        :highlight-current-row="true"
        style="width: 100%">
        <el-table-column
          type="selection"
          align="center"
          width="50">
        </el-table-column>
        <el-table-column
          type="index"
          label="序号"
          align="center"
          width="50">
        </el-table-column>
        <el-table-column
          prop="username"
          label="用户名"
          align="center"
          width="100">
        </el-table-column>
        <el-table-column
          prop="name"
          label="用户姓名"
          align="center"
          width="100">
        </el-table-column>
        <el-table-column
          prop="nickname"
          label="用户昵称"
          align="center"
          width="100">
        </el-table-column>
        <el-table-column
          prop="phone"
          label="联系电话"
          align="center"
          width="120">
        </el-table-column>
        <el-table-column
          prop="email"
          label="邮箱"
          align="center"
          width="150">
        </el-table-column>
        <el-table-column
          prop="geneder"
          label="性别"
          align="center"
          width="50">
        </el-table-column>
        <el-table-column
          prop="loginDate"
          label="最后登录时间"
          align="center"
          width="150">
        </el-table-column>
        <el-table-column
          prop="loginIp"
          label="登录IP"
          align="center"
          width="120">
        </el-table-column>
        <el-table-column
          fixed="right"
          label="操作"
          width="100">
          <template slot-scope="scope">
            <el-button @click="view(scope.row)" type="text" size="small">查看</el-button>
            <el-button @click="edit(scope.row)" type="text" size="small">编辑</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="page.currentPage"
        :page-sizes="page.pageSizes"
        :page-size="page.pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="page.total">
      </el-pagination>
    </div>
    <div id="dialog">
      <el-dialog title="查看详情" width="70%" :close-on-click-modal="false" :visible.sync="dialog.viewVisible">
        <user-view :rowData="currentRow" v-on:close="closeDialog">
        </user-view>
      </el-dialog>
      <el-dialog title="添加用户" width="60%" :close-on-click-modal="false" :visible.sync="dialog.addVisible">
        <user-add v-on:close="closeDialogAdd">
        </user-add>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import store from '@/views/sys/user/list/store/index.js'
import { mapState, mapMutations, mapActions } from 'vuex'
import userView from '@/views/sys/user/view/index.vue'
import userAdd from '@/views/sys/user/add/index.vue'

const storeName = 'userListStore'
const data = () => {
  return {
    currentRow: {},
    dialog: {
      addVisible: false,
      viewVisible: false,
      editVisible: false
    },
    rules: {
      username: [
        { required: true, target: 'change' }
      ]
    }
  }
}
const computed = {
  ...mapState(storeName, ['loading', 'searchFormData', 'tableData', 'page'])
}

const methods = {
  queryForm () {
    this.page.currentPage = 1
    this.queryUserList()
  },
  resetForm () {
    this.$refs.searchForm.resetFields()
  },
  add () {
    this.dialog.addVisible = true
  },
  view (row) {
    this.currentRow = row
    this.dialog.viewVisible = true
  },
  edit (row) {
    this.currentRow = row
    this.dialog.editVisible = true
  },
  closeDialog () {
    this.dialog.viewVisible = false
  },
  closeDialogAdd () {
    this.dialog.addVisible = false
  },
  handleSizeChange (val) {
    this.page.currentPage = 1
    this.page.pageSize = val
    this.queryUserList()
  },
  handleCurrentChange (val) {
    this.page.currentPage = val
    this.queryUserList()
  },
  ...mapMutations(storeName, ['changeLoading']),
  ...mapActions(storeName, ['queryUserList'])
}
export default {
  name: 'user',
  components: {
    userView,
    userAdd
  },
  beforeCreate: function () {
    this.$store.registerModule(storeName, store)
  },
  destroyed: function () {
    this.$store.unregisterModule(storeName)
  },
  mounted: function () {
    console.log('mounted......')
    this.queryUserList()
  },
  data: data,
  computed: computed,
  methods: methods
}
</script>
<style scoped>
  hr {
    border: none;
    border-top: 1px solid #eee;
  }
  #search {
    padding: 10px;
    text-align: left;
  }
  #content {
    text-align: left;
  }
</style>
