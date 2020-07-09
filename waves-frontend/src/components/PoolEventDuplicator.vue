<template>
    <el-button class="vca-button-primary" 
    type="primary" 
    @click="submit" 
    style="margin-left:0px;margin-right:0px;">
    duplicate</el-button>
</template>

<script>
export default {
name : "PoolEventDuplicator",
props : ['poolEvent'],
methods : {
    submit(){
        this.poolEvent.title = this.poolEvent.title + " (copy)";
        this.$store.dispatch('POST_POOLEVENT', this.poolEvent);
        this.notifySuccess();
    },
    notifySuccess() {
      setTimeout(() => {
        this.$notify.success({
          title: "Poolevent successfuly duplicated",
          message: "",
          offset: 100
        });

      }, 3000);
    }
}

}
</script>

<style>
.vca-button-primary {
  background-color: #0a6b91;
  color: #FFFFFF;
  padding: 0.5em 0;
  border: 0;
  text-transform: uppercase;
  font-weight: bold;
  text-decoration: none;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
  box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 3px 10px 0 rgba(0, 0, 0, 0.19);
  -moz-box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 3px 10px 0 rgba(0, 0, 0, 0.19);
  -webkit-box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 3px 10px 0 rgba(0, 0, 0, 0.19);
}

</style>
