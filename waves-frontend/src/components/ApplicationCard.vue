  <template>
  <div>
    <el-checkbox
      :indeterminate="isIndeterminate"
      v-model="checkAll"
      @change="handleCheckAllChange"
    >Check all</el-checkbox>
    <div style="margin: 15px 0;"></div>
    <el-checkbox-group v-model="checkedCities" @change="handleCheckedCitiesChange">
      <el-card
        v-for="application in applications"
        :key="application.id"
        :body-style="{ padding: '0px' }"
        style="padding:20px;margin:0;"
      >
        <el-col :span="1">
          <el-checkbox></el-checkbox>
        </el-col>
        <el-col :span="23">
          <span style="margin-left:10px;">{{`${application.first_name} ${application.last_name}`}}</span>
          <el-tag
            style="float:right;padding:0;"
            :type="application.state=='WAITING'?'warning'
              :application.state=='ACCEPTED'?'success':'danger'"
            size="mini"
          >{{application.state}}</el-tag>
          <el-row style="background:#eee;padding:10px;border-radius:5px;margin-top:10px">
            <span>{{application.text}}</span>
          </el-row>
        </el-col>
      </el-card>
    </el-checkbox-group>
  </div>
</template>

<script>
export default {
  name: "ApplicationCard",
  data() {
    return {
      checkAll: false,
      checkedCities: [],
      cities: [],
      isIndeterminate: true
    };
  },
  props: ["application", "list", "selected"],
  methods: {
    applicationHandler(id) {
      this.selected = true;
      if (this.selected) {
        this.list.push(id);
      } else {
        this.list.splice(this.list.indexOf(id), 1);
      }
    },
    handleCheckAllChange(val) {
      this.checkedCities = val ? cityOptions : [];
      this.isIndeterminate = false;
    },
    handleCheckedCitiesChange(value) {
      let checkedCount = value.length;
      this.checkAll = checkedCount === this.cities.length;
      this.isIndeterminate =
        checkedCount > 0 && checkedCount < this.cities.length;
    }
  }
};
</script>

<style>
</style>

