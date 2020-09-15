<template>
<el-dialog
:show="true"
  title="Welcome to Viva con Agua"
  :visible.sync="dialogVisible"
  width="60%"

  style="height:1000px"
  :before-close="handleClose"
  >
<el-carousel style="height:500px" :interval="20000" arrow="always">
    <el-carousel-item style="width:100%;height:450px;" >
        <el-image style="width:100%;height:450px;" :src="require('../assets/icons/tutorial_dialog.png')"/> 
    </el-carousel-item>
  </el-carousel>
  
</el-dialog>
  
</template>

<script>

export default {
    name: "Tutorial",
    data: ()=>{
        return {
            dialogVisible: true,
            images : [
            "https://via.placeholder.com/150",
            "https://via.placeholder.com/150"]
        }
    },
    methods: {
      handleClose(done) {
        this.$confirm('Are you sure to close this dialog?')
          .then(_ => {
            done();
          })
          .catch(_ => {});
      }
    }
}
</script>

<style>

</style>