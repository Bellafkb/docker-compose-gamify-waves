<template>
  <div style="margin-top:50px;width:30%;margin:auto">
    <el-card style="margin-top:40px">
      <el-row
        class="mst-fvd-item"
        style="padding:10px"
        v-for="pe in getRecomandations"
        :key="pe.id"
      >
        <a style="text-decoration:none;color:black" :href="`/waves/poolevent/${pe.id}`">
          <el-col  :span="3">
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
    </el-card>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
export default {
  name: "RecomandationView",
  components: {},
  data() {
    return {};
  },
  methods: {
    ...mapActions({ fetchRecomandations: "FETCH_RECOMANDATIONS" }),
    calculateMonth(date) {
      let d = new Date(date);
      return d.toLocaleString("default", { month: "short" });
    },
    calculateDay(date) {
      let d = new Date(date);
      return d.toLocaleString("default", { weekday: "short" });
    }
  },
  mounted() {
    this.fetchRecomandations();
    console.log(this.getRecomandations);
  },
  computed: {
    ...mapGetters(["getRecomandations"])
  }
};
</script>

<style>
</style>