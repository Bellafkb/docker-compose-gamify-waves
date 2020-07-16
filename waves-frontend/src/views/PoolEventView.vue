<template>
  <div style="margin-top:45px" v-if="poolEvent">
    <el-row>
      <el-card>
        <div slot="header" class="clearfix">
          <strong>{{ poolEvent.event_name }}</strong>
          <span style="color:grey;float:right">{{ poolEvent.type_name }}</span>
          <div>
            <el-tag
              size="mini"
              class="active-user-tag"
              v-if="poolEvent.active_user_only"
              type="warning"
              >active users only</el-tag
            >
            <el-tag
              size="mini"
              v-if="poolEvent.state === 'UNRELEASED'"
              type="gray"
              >{{ $t("poolEventView.state.unreleased") }}</el-tag
            >
            <el-tag
              size="mini"
              type="success"
              v-if="poolEvent.state === 'RELEASED'"
              >{{ $t("poolEventView.state.released") }}</el-tag
            >
            <el-tag
              size="mini"
              v-if="poolEvent.state === 'REJECTED'"
              type="danger"
              >{{ $t("poolEventView.state.refused") }}</el-tag
            >
            <el-tag
              size="mini"
              v-if="poolEvent.state === 'DRAFT'"
              type="standard"
              >{{ $t("poolEventView.state.draft") }}</el-tag
            >
            <el-tag
              size="mini"
              v-if="poolEvent.state === 'CANCELED'"
              type="warning"
              >{{ poolEvent.state }}</el-tag
            >
          </div>
        </div>

        <el-row>
          <ul class="event-start-end">
            <li>
              <i class="el-icon-location-outline"></i>
            </li>
            <li>
              {{
                `${poolEvent.location.route} ${poolEvent.location.street_number}, ${poolEvent.location.postal_code} ${poolEvent.location.locality}`
              }}
            </li>
          </ul>
        </el-row>
        <el-row>
          <ul class="event-start-end">
            <li>
              <i class="el-icon-time"></i>
            </li>
            <li>
              {{
                `${new Date(poolEvent.event_start).getUTCHours()}:${new Date(
                  poolEvent.event_start
                ).getUTCMinutes()}h`
              }}
              -
              {{
                `${new Date(poolEvent.event_end).getUTCHours()}:${new Date(
                  poolEvent.event_end
                ).getUTCMinutes()}h`
              }}
            </li>
          </ul>
        </el-row>
        <el-row>
          <ul class="event-start-end">
            <li>
              <i class="el-icon-date"></i>
            </li>
            <li>
              {{ new Date(poolEvent.event_start).getDate() }}.
              {{
                new Date(poolEvent.event_start).toLocaleString("default", {
                  month: "short"
                })
              }}
              {{ new Date(poolEvent.event_start).getFullYear() }} -
              {{ new Date(poolEvent.event_end).getDate() }}.
              {{
                new Date(poolEvent.event_end).toLocaleString("default", {
                  month: "short"
                })
              }}
              {{ new Date(poolEvent.event_end).getFullYear() }}
            </li>
          </ul>
        </el-row>

        <el-row>
          <ul class="event-start-end">
            <li>
              <i class="el-icon-info"></i>
            </li>
            <li>{{ poolEvent.website }}</li>
          </ul>
        </el-row>

        <el-row>
          <ul class="event-start-end">
            <li>
              <i class="el-icon-user"></i>
            </li>
            <li>
              {{ poolEvent.asp.fullName }} (crew:
              {{ poolEvent.asp.crew.crewName }})
            </li>
          </ul>
        </el-row>
        <el-row >
          <el-col
            :lg="size"
            v-if="appState == (APPSTATE.ADMIN || APPSTATE.VOLUNTEER_MANAGER)"
            style="text-align:center"
          >
            <el-button
              style="margin-top:5px;
                width:40px;
                height:40px;
                margin:auto;
                border:0
                text-align:center"
              @click="
                () =>
                  this.$router.push(
                    `/waves/applications/${this.$route.params.id}`
                  )
              "
              circle
            >
              <i class="el-icon-circle-plus"></i>
            </el-button>
          </el-col>
          <el-col :lg="size" style="text-align:center">
            <ApplicationButton
              :poolevent_id="id"
              style="width:40px;margin:0;border:0;text-align:center;margin:auto"
            />
          </el-col>
          <el-col :lg="size" style="text-align:center">
            <SharingButton
              :location="
                `https://localhost${this.$router.history.current.path}`
              "
              style="width:40px;margin:0;border:0;text-align:center;margin:auto"
            />
          </el-col>
          <el-col :lg="size" style="text-align:center">
            <FavoriteButton :poolevent_id="id" />
          </el-col>
          <el-col
            :lg="4"
            v-if="appState == (APPSTATE.ADMIN || APPSTATE.VOLUNTEER_MANAGER)"
            style="text-align:center"
          >
            <PooleventDropdown
              :poolevent="poolEvent"
              style="margin-top:0;padding-top:0;"
            />
          </el-col>
        </el-row>
      </el-card>
    </el-row>
    <el-row>
      <el-card
        v-if="poolEvent.description.html"
        :title="$t('poolEventView.description')"
      >
        <div v-html="getDescription"></div>
      </el-card>
      <el-card :body-style="{ padding: '0px' }">
        <div style="margin:13px">
          <p>{{ poolEvent.location.desc }}</p>
        </div>
      
      </el-card>
    </el-row>
    <el-row>
      <CommentForm />
      <CommentCards :pid="this.$route.params.id" />
    </el-row>
  </div>
</template>
<script>
import PooleventDropdown from "../components/PooleventDropdown";
import ApplicationButton from "../components/ApplicationButton";
import SharingButton from "../components/SharingButton";
import CommentCards from "../components/CommentCards";
import CommentForm from "../components/CommentForm";
import FavoriteButton from "../components/FavoriteButton";
import { APP_STATE } from "../store/auth";
import { mapGetters, mapActions } from "vuex";

export default {
  name: "PoolEventView",
  data() {
    return {
      APPSTATE: APP_STATE,
      index: 0,
      id: this.$route.params.id,
      buttonOptions: {
        unreleased: "release",
        released: "refuse",
        refused: "release"
      },
      applied: false,
      markers: [],
      places: [],
      currentPlace: null
    };
  },
  components: {
    ApplicationButton,
    CommentForm,
    CommentCards,
    PooleventDropdown,
    SharingButton,
    FavoriteButton
  },
  computed: {
    size() {
      return this.APPSTATE.ADMIN || this.APP_STATE.VOLUNTEER_MANAGER ? 5 : 8;
    },
    ...mapGetters(["getPoolEvent", "getUser", "appState"]),
    poolEvent() {
      return this.getPoolEvent;
    },
    getDescription() {
      return this.poolEvent.description.html;
    }
  },
  mounted() {
    this.GET_POOLEVENT_BY_ID(this.id);
  },
  methods: {
    ...mapActions(["GET_POOLEVENT_BY_ID"]),
    releasePooleEvent() {
      this.$store.dispatch("SET_TO_RELEASED", this.id);
    },
    refusePoolEvent() {
      this.$store.dispatch("SET_TO_REFUSED", this.id);
    },
    deletePoolEvent() {
      this.$store.dispatch("DELETE_POOLEVENT", this.id);
    },
    editPoolEvent() {
      this.$router.push("/editpooleventform/" + this.id);
    },
    applicationHandler() {
      this.$router.push("/waves/applications/" + this.id);
    },
    setPlace(place) {
      this.currentPlace = place;
    },
    addMarker() {
      if (this.currentPlace) {
        const marker = {
          lat: this.currentPlace.geometry.location.lat(),
          lng: this.currentPlace.geometry.location.lng()
        };
        this.markers.push({ position: marker });
        this.places.push(this.currentPlace);
        this.center = marker;
        this.currentPlace = null;
      }
    }
  }
};
</script>

<style lang="less">
.active-user-tag {
  margin-right: 10px;
}

.location-note {
  text-align: justify;
}

#location-label {
  margin-left: 25%;
}

.location-row {
  margin-top: 20px;
}

.event-start-end {
  list-style: none;
  margin: 0;
  padding: 0;
  li {
    float: left;
    padding: 5px;
  }
}
</style>

/**
  <GmapMap
          :center="{
            lat: parseFloat(poolEvent.location.latitude),
            lng: parseFloat(poolEvent.location.longitude)
          }"
          :zoom="14"
          map-type-id="terrain"
          style=" width : 100%; height: 200px; "
        >
          <GmapMarker
            :position="{
              lat: parseFloat(poolEvent.location.latitude),
              lng: parseFloat(poolEvent.location.longitude)
            }"
            :key="index++"
            :clickable="true"
            :draggable="true"
          />
        </GmapMap>
 */