<template>
  <div style="margin-top:40px;width:100%">
    <el-card style="width:100%">
      <div slot="header">
        <span style="color:grey">Recomanded</span>
      </div>

      <el-row
        class="mst-fvd-item"
        style="padding:10px"
        v-for="pe in mostFavedPoolevents"
        :key="pe.id"
      >
        <a style="text-decoration:none;color:black" :href="`/waves/event/${pe.id}`">
          <el-col :span="6">
            <el-row>
              <strong style="color:grey">{{`${calculateMonth(pe.event_start).toUpperCase()}`}}</strong>
            </el-row>
            <el-row>
              <el-col :span="6" style="text-align:center">
                <span style="font-size:18px;color:grey">{{new Date(pe.event_start).getDate()}}</span>
              </el-col>
            </el-row>
          </el-col>
          <el-col :span="18">
            <el-row>
              <span style="margin:0px">{{pe.pe_name}}</span>
            </el-row>
            <el-row>
              <span style="color:grey">{{pe.type_name.toLowerCase()}}</span>
            </el-row>
          </el-col>
        </a>
      </el-row>
      <el-row>
        <div>
          <el-button
            type="primary"
            style="margin-left:25%;width:50%;margin-top:10px"
            size="mini"
            @click="()=> this.$router.push('/waves/recomandations')"
          >SEE ALL</el-button>
        </div>
      </el-row>
    </el-card>
  </div>
</template>

<script>
import Axios from "axios";
export default {
  name: "MostFavedPoolevents",
  data() {
    return {
      mostFavedPoolevents: ""
    };
  },
  mounted() {
    this.fetchMostFavedPoolevents();
  },
  methods: {
    async fetchMostFavedPoolevents() {
      const { data } = await Axios.get("/waves/api/v1/favorite/most/me");
      this.mostFavedPoolevents = data.recomandations;
    },
    calculateMonth(date) {
      let d = new Date(date);
      return d.toLocaleString("default", { month: "short" });
    },
    calculateDay(date) {
      let d = new Date(date);
      return d.toLocaleString("default", { weekday: "short" });
    }
  }
};
</script>

<style>
.mst-fvd-item:hover {
  background: #eee;
}
</style>