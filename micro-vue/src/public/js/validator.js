/**
 * 自定义验证规则
  */

// 例子：验证年龄
var checkAge = (rule, value, callback) => {
  if (!value) {
    return callback(new Error('年龄不能为空'))
  }
  setTimeout(() => {
    if (!Number.isInteger(value)) {
      callback(new Error('请输入数字值'))
    } else {
      if (value < 18) {
        callback(new Error('必须年满18岁'))
      } else {
        callback()
      }
    }
  }, 1000)
}

/**
 * 验证手机号码
 * @param rule
 * @param value
 * @param callback
 */
var phone = (rule, value, callback) => {
  if (!value) {
    callback(new Error('年龄不能为空'))
  }else{
    callback()
  }
}

/**
 * 验证邮箱
 * @param rule
 * @param value
 * @param callback
 */
var email = (rule, value, callback) => {
  if (!value) {
    callback(new Error('年龄不能为空'))
  }else{
    callback()
  }
}

export { checkAge , phone, email }
export default {
  checkAge: checkAge,
  phone: phone,
  email: email
}
