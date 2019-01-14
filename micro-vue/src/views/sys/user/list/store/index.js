const userList = [{
  username: 'wangxiaohu',
  name: '王小虎',
  nickname: '小老虎',
  loginIp: '192.168.1.1',
  loginDate: '2019-01-09 22:11:20',
  phone: '15827423805',
  email: '394152110@qq.com',
  geneder: '男'
}, {
  username: 'wangxiaohu',
  name: '王小虎',
  nickname: '小老虎',
  loginIp: '192.168.1.1',
  loginDate: '2019-01-09 22:11:20',
  phone: '15827423805',
  email: '394152110@qq.com',
  geneder: '男'
}, {
  username: 'wangxiaohu',
  name: '王小虎',
  nickname: '小老虎',
  loginIp: '192.168.1.1',
  loginDate: '2019-01-09 22:11:20',
  phone: '15827423805',
  email: '394152110@qq.com',
  geneder: '男'
}, {
  username: 'wangxiaohu',
  name: '王小虎',
  nickname: '小老虎',
  loginIp: '192.168.1.1',
  loginDate: '2019-01-09 22:11:20',
  phone: '15827423805',
  email: '394152110@qq.com',
  geneder: '男'
}, {
  username: 'wangxiaohu',
  name: '王小虎',
  nickname: '小老虎',
  loginIp: '192.168.1.1',
  loginDate: '2019-01-09 22:11:20',
  phone: '15827423805',
  email: '394152110@qq.com',
  geneder: '男'
}, {
  username: 'wangxiaohu',
  name: '王小虎',
  nickname: '小老虎',
  loginIp: '192.168.1.1',
  loginDate: '2019-01-09 22:11:20',
  phone: '15827423805',
  email: '394152110@qq.com',
  geneder: '男'
}, {
  username: 'wangxiaohu',
  name: '王小虎',
  nickname: '小老虎',
  loginIp: '192.168.1.1',
  loginDate: '2019-01-09 22:11:20',
  phone: '15827423805',
  email: '394152110@qq.com',
  geneder: '男'
}, {
  username: 'wangxiaohu',
  name: '王小虎',
  nickname: '小老虎',
  loginIp: '192.168.1.1',
  loginDate: '2019-01-09 22:11:20',
  phone: '15827423805',
  email: '394152110@qq.com',
  geneder: '男'
}, {
  username: 'wangxiaohu',
  name: '王小虎',
  nickname: '小老虎',
  loginIp: '192.168.1.1',
  loginDate: '2019-01-09 22:11:20',
  phone: '15827423805',
  email: '394152110@qq.com',
  geneder: '男'
}, {
  username: 'wangxiaohu',
  name: '王小虎',
  nickname: '小老虎',
  loginIp: '192.168.1.1',
  loginDate: '2019-01-09 22:11:20',
  phone: '15827423805',
  email: '394152110@qq.com',
  geneder: '男'
}]

const state = () => {
  return {
    loading: false,
    searchFormData: {
      username: ''
    },
    tableData: [],
    page: {
      currentPage: 1,
      pageSize: 10,
      pageSizes: [10, 20, 50, 100],
      total: 0
    }
  }
}

const mutations = {
  changeLoading (state, val) {
    state.loading = val
  },
  setUserList (state, payload) {
    state.tableData = payload
    state.page.total = 123
  }
}

const actions = {
  queryUserList (context, payload) {
    context.commit('changeLoading', true)
    setTimeout(function () {
      context.commit('changeLoading', false)
      context.commit('setUserList', userList)
    }, 1000)
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
