<template>
    <div style="text-align: left" v-loading="loading">
      <el-form ref="addForm" :model="formData" :rules="rules" :inline="true" size="small" label-width="150px" >
        <el-form-item label="用户名：" prop="username">
          <el-input v-model="formData.username"></el-input>
        </el-form-item>
        <el-form-item label="用户姓名：" prop="name">
          <el-input v-model="formData.name"></el-input>
        </el-form-item>
        <el-form-item label="用户昵称：" prop="nickname">
          <el-input v-model="formData.nickname"></el-input>
        </el-form-item>
        <el-form-item label="联系电话：" prop="phone">
          <el-input type="tel" v-model="formData.phone"></el-input>
        </el-form-item>
        <el-form-item label="邮箱：" prop="email">
          <el-input type="email" v-model="formData.email"></el-input>
        </el-form-item>
        <el-form-item label="性别：" prop="geneder">
          <el-select v-model="formData.geneder" placeholder="请选择">
            <el-option
              v-for="item in sex"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div style="text-align: center">
        <slot name="footer">
          <el-button type="primary" @click="submit">保存</el-button>
          <el-button type="primary" @click="$emit('close')">关闭</el-button>
        </slot>
      </div>
    </div>
</template>

<script>
import store from '@/views/sys/user/add/store/index.js'
import { mapState, mapMutations, mapActions } from 'vuex'
// import validator from '@/public/js/validator.js'

const storeName = 'userAddStore'
const data = () => {
  return {
    rules: {
      username: [
        { required: true, message: '此项必填', target: 'blur' }
      ],
      name: [
        { required: true, message: '此项必填', target: 'blur' }
      ],
      nickname: [
        { required: true, message: '此项必填', target: 'blur' }
      ]
    }
  }
}
const computed = {
  ...mapState(storeName, ['loading', 'formData', 'sex'])
}

const methods = {
  submit () {
    var that = this
    console.log('submit', this.formData)
    this.$refs.addForm.validate( valid => {
      if (!valid) { // 验证不通过
        return false
      }
      this.saveUser({
        successCallback: function () {
          console.log('successCallback...')
          that.$message.success('操作成功!')
          that.$emit('close')
        }
      })
    })
  },
  ...mapMutations(storeName, []),
  ...mapActions(storeName, ['saveUser'])
}
export default {
  name: 'userAdd',
  components: {

  },
  beforeCreate: function () {
    this.$store.registerModule(storeName, store)
  },
  destroyed: function () {
    console.log('userAdd...destroyed')
    this.$store.unregisterModule(storeName)
  },
  mounted: function () {
    console.log('userAdd...mounted')
  },
  activated: function () {
    console.log('userAdd...activated')
  },
  deactivated: function () {
    console.log('userAdd...deactivated')
  },
  data: data,
  computed: computed,
  methods: methods
}
</script>

<style scoped>
  .item-content {
    width: 120px;
    text-align: left;
  }
</style>
