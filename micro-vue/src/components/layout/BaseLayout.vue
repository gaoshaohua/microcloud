<template>
  <el-container id="contain">
    <el-header>Header</el-header>
    <el-container>
      <el-aside width="200px">
        <slot name="aside"></slot>
      </el-aside>
      <el-container>
        <el-main>
          <router-view></router-view>
        </el-main>
        <el-footer height="20px">@2019 micro vue</el-footer>
      </el-container>
    </el-container>
  </el-container>
</template>

<script>
export default {
  name: 'BaseLayout'
}
</script>

<style>
  body {
    margin: 0px;
  }
  #contain{
    position: absolute;
    width:100%;
    height:100%;
    margin: 0px;
  }

  .el-footer {
    color: #999;
    font-size: 10px;
    text-align: center;
  }

  .el-aside {
    background-color: #FFFFFF;
    color: #333;
    text-align: center;
    border-right: 1px solid #aaa;
  }

  .el-main {
    color: #333;
    text-align: center;
  }
</style>
