<template>
  <div >
    <el-row>
    <el-row>
      <PoolEventFilter />
    </el-row>
      <el-col :span="24">
        <el-row v-for="poolevent in getAllPoolEvents" :key="poolevent.idevent">
          <PoolEventCard style="margin-top:10px" :poolEvent="poolevent" />
        </el-row>
        <el-row>
          <Pagination style="margin:30px 0 30px 40%;"/>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import PoolEventCard from "../components/PoolEventCard";
import PoolEventFilter from "../components/PoolEventFilter";
import Pagination from "../components/Pagination";


export default {
  name: "PoolEventsView",
  components: {
    PoolEventCard,
    PoolEventFilter,
    Pagination
  },
  mounted() {
    this.fetchPoolevents("");
  },
  computed: {
    ...mapGetters(["getAllPoolEvents"])
  },
  methods: {
    ...mapActions({
      fetchPoolevents: "FETCH_POOLEVENTS_BY_FILTER"
    })
  }
};
</script>

<style lang="less" scoped>
input {
  position: relative;
  font-size: 14px;
  display: inline-block;
  width: 95%;
  background-color: #fff;
  border-radius: 4px;
  border: 1px solid #dcdfe6;
  box-sizing: border-box;
  color: #606266;
  height: 40px;
  line-height: 40px;
  outline: 0;
  padding: 0 15px;
  transition: border-color 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
}
#tag {
  float: left;
}

.el-button {
  margin-left: 0;
  margin-right: 0;
}

.most-faved {
  display: none;
}
.p-container {
  margin: auto;
  width: 100%;
}
@media only screen and (min-width: 768px) {
  .most-faved {
    display: block;
  }
  .p-container {
    margin: auto;
    width: 60%;
  }
}
</style>
