const state = () => {
  return {
    menuTreeData: [
      {
        'id': 1,
        'parentId':0,
        'name': '系统管理',
        'url': '',
        'level': 1,
        'childers': [
          {
            'id': 2,
            'parentId':1,
            'name': '用户管理',
            'url': '/sys/user/index',
            'level': 2
          },
          {
            'id': 3,
            'parentId':1,
            'name': '角色管理',
            'url': '/sys/role/index',
            'level': 2
          },
          {
            'id': 4,
            'parentId':1,
            'name': '资源管理',
            'url': '/sys/resources/index',
            'level': 2
          }
        ]
      },
      {
        'id': 7,
        'parentId':0,
        'name': '系统数据',
        'url': '',
        'level': 1,
        'childers': [
          {
            'id': 8,
            'parentId':7,
            'name': '日志管理',
            'url': '/sys_log/main',
            'level': 2
          },
          {
            'id': 9,
            'parentId':7,
            'name': '数据监控',
            'url': '/sys_role/main',
            'level': 2
          },
          {
            'id': 10,
            'parentId':7,
            'name': '区域信息',
            'url': '/sys_area/main',
            'level': 2
          }
        ]
      }
    ]
  }
}

const mutations = {
  setMenuTreeData (state, payload) {
    state.menuTreeData = payload
  }
}

const actions = {
  getMenuTreeData ({ commit }, payload) {
    setTimeout(function () {
      commit('setMenuTreeData', [])
    }, 1000)
  }

}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
