
const state = () => {
  return {
    loading: false,
    formData: {
      username: '',
      name: null,
      nickname: null,
      phone: null,
      email: null,
      geneder: null
    },
    sex: [{
      label: '男',
      value: 1
    }, {
      label: '女',
      value: 0
    }]
  }
}

const mutations = {
  changeLoading (state, payload) {
    state.loading = payload
  }
}

const actions = {
  saveUser (context, payload) {
    context.commit('changeLoading', true)
    setTimeout(function () {
      context.commit('changeLoading', false)
      if (true) { // 保存成功
        payload.successCallback()
      } else { // 保存失败

      }
    }, 1000)
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
