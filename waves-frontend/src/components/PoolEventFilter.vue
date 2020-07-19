<template>
  <el-form>
    <el-row>
      <el-button
        style="margin-left:0;width:80px;padding:10px;border:0;background-color:#e9ebee"
        @click="
          () => {
            show ? (show = false) : (show = true);
          }
        "
        icon="el-icon-s-operation"
        >FILTER</el-button
      >
    </el-row>
    <el-collapse-transition>
      <el-row  v-if="show" style="margin:auto;">
        <el-col
          v-if="appState == APP_STATE.ADMIN"
          style="padding:5px"
          :lg="size"
        >
          <el-form-item prop="type">
            <el-select
              @change="filterButtonHandler"
              style="width:100%"
              v-model="filter.state"
              placeholder="State"
            >
              <el-option label="unreleased" value="UNRELEASED"></el-option>
              <el-option label="released" value="RELEASED"></el-option>
              <el-option label="rejected" value="REJECTED"></el-option>
              <el-option label="canceled" value="CANCELED"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :lg="size" style="padding:5px">
          <el-form-item prop="type">
            <el-select
              @change="filterButtonHandler"
              style="width:100%"
              v-model="filter.type"
              placeholder="Type"
            >
              <el-option
                v-for="type in eventtypes"
                :key="type.idevent_type"
                :label="type.name"
                :value="type.idevent_type"
              ></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :lg="size" style="padding:5px">
          <el-form-item prop="region">
            <el-select
              @change="filterButtonHandler"
              style="width:100%"
              v-model="filter.region"
              placeholder="Region"
            >
              <el-option
                v-for="region in regions"
                :key="region.locality"
                :label="region.locality"
                :value="region.locality"
              ></el-option>
            </el-select>
          </el-form-item>
        </el-col>

        <el-col :lg="size" style="padding:5px">
          <el-form-item prop="type">
            <el-select
              @change="filterButtonHandler"
              style="width:100%"
              v-model="filter.start"
              placeholder="Month"
            >
              <el-option
                v-for="month in getAllMonths"
                :key="month"
                :label="month"
                :value="month"
              ></el-option>
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
    </el-collapse-transition>
  </el-form>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "PoolEventFilter",
  data() {
    return {
      filter: {},
      store: this.$store,
      poolevents: this.$store.getters.getAllPoolEvents.data,
      show: false,
      types: []
    };
  },
  props: ["getUser"],
  methods: {
    ...mapActions(["FETCH_MONTHS", "FETCH_REGIONS", "FETCH_EVENTTYPES"]),

    filterButtonHandler() {
      if (this.show) {
        const keys = Object.keys(this.filter);
        let filter = "";
        keys.map(key => {
          filter += `${key}=${this.filter[key]}&`;
        });
        this.$store.dispatch("FETCH_POOLEVENTS_BY_FILTER", filter);
      } else {
        this.show = true;
      }
    }
  },
  mounted() {
    this.FETCH_MONTHS();
    this.FETCH_REGIONS();
    this.FETCH_EVENTTYPES();
  },
  computed: {
    ...mapGetters([
      "getAllMonths",
      "regions",
      "types",
      "appState",
      "APP_STATE"
    ]),
    size(){
      return this.appState == this.APP_STATE.ADMIN?6:8
    }
  }
};
</script>

<style>
.el-select {
  display: block;
}
</style>
