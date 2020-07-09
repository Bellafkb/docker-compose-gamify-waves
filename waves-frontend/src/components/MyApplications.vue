<template>
  <div>
    <el-row style="margin-top:20px">
      <el-col v-for="application in getApplications" :key="application.id" :span="24">
        <el-card
          :body-style="{ padding: '0px' }"
          style="padding:20px;margin:10px;margin-bottom:5px;width:90%"
        >
          <el-row>
            <el-row>
              <a
                style="text-decoration:none;color:black"
                :href="`/waves/event/${application.poolevent_id}`"
              >
                <span>{{application.name}}</span>
              </a>

              <el-tag
                style="float:right;padding:0;"
                :type="application.state=='WAITING'?'warning'
              :application.state=='ACCEPTED'?'success':application.state=='CANCELED'?'danger':'danger'"
                size="mini"
              >{{application.state}}</el-tag>
            </el-row>
            <el-row v-if="application.text">
              <p class="row-text-application" style>{{application.text}}</p>
            </el-row>
            <el-row>
              <el-button
                type="danger"
                style="width:100px;
                margin:0;
                padding:5px;
                float:right"
                @click="cancelApplication(application.id)"
              >
                <i class="el-icon-close"></i> CANCEL
              </el-button>
            </el-row>
          </el-row>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import { mapGetters } from 'vuex';
export default {
  name: "MyApplications",
  data() {
    return {
      states: {
        WAITING_LIST: "WAITING_LIST",
        ACCEPTED: "ACCEPTED",
        REJECTED: "REJECTED"
      },
      config: ""
    };
  },
  computed:{
    ...mapGetters(["getApplications"])
  }
};
</script>

<style lang="less" scoped>
.row-text-application {
  border-radius: 5px;
  background: #eee;
  padding: 10px;
}
</style>
