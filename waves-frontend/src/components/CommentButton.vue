<template>
  <el-dropdown style="margin-top:0;padding:0" trigger="click">
    <span class="el-dropdown-link">
      <el-button style="transform: rotate(90deg);width:40px;float:right;margin:0;border:0" circle>
        <i class="el-icon-more"></i>
      </el-button>
    </span>
    <el-dropdown-menu style="margin:0;padding:0;width:100px" slot="dropdown">
      <ul>
          <li>
              lorem
          </li>
      </ul>
    </el-dropdown-menu>
  </el-dropdown>
</template>

<script>
export default {
name: "CommentButton"
}
</script>

<style>

</style>