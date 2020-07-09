<template>
  <el-button
    style="
  border:0;
  width:40px;
  height:40px;
  margin:0;
  margin:auto;
  padding:0px;"
    @click="setFavorite"
    circle
  >
    <i
      :v-model="favorite.poolevent_id=poolevent_id"
      style="width:100%;float:right;margin:0;padding:0"
      class="el-icon-star-on"
    />
  </el-button>
</template>

<script>
import Axios from "axios";
export default {
  name: "FavoriteButton",
  props: ["poolevent_id"],
  data() {
    return {
      favorite: {
        poolevent_id: ""
      }
    };
  },
  methods: {
    async setFavorite() {
      try {
        const config = {
          headers: {
            Authorization: `bearer ${this.$cookies.get("access_token")}`
          }
        };
        await Axios.post("/waves/api/v1/favorite", this.favorite, config);
      } catch (error) {
        throw error.message;
      }
    }
  }
};
</script>

<style scoped>
</style>