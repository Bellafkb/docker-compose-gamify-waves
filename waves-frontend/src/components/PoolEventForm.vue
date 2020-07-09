<template>
  <el-container>
    <el-form :model="poolevent" ref="poolevent" :rules="rules"  >
      <el-col :span="11">
        <el-card>
          <el-form-item
            :label="$t('poolEventForm.input.title.label')"
            prop="front.name"
          >
            <el-input
              v-model="poolevent.front.name"
              :placeholder="$t('poolEventForm.input.title.placeholder')"
            ></el-input>
          </el-form-item>

          <el-form-item
            :label="$t('poolEventForm.input.type.label')"
            prop="front.idevent_type"
          >
            <el-select
              v-model="poolevent.front.idevent_type"
              :placeholder="$t('poolEventForm.input.type.placeholder')"
              style="width:100%"
            >
              <el-option
                v-for="type in eventtypes"
                :key="type.id"
                :label="type.name"
                :value="type.idevent_type"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item
            :label="$t('poolEventForm.input.website.label')"
            prop="front.website"
          >
            <el-input
              v-model="poolevent.front.website"
              :placeholder="$t('poolEventForm.input.website.placeholder')"
            ></el-input>
          </el-form-item>
          <el-form-item :label="$t('poolEventForm.input.activeUserOnly.label')">
            <el-switch
              :active-value="1"
              :inactive-value="0"
              v-model="poolevent.front.active_user_only"
            ></el-switch>
          </el-form-item>
          <el-form-item
            :label="$t('poolEventForm.input.start.label')"
            prop="front.event_start"
          >
            <el-date-picker
              type="date"
              :placeholder="
                $t('poolEventForm.input.start.datePicker.placeholder')
              "
              v-model="poolevent.front.event_start"
              style="width: 100%;"
            ></el-date-picker>
            <el-time-picker
              :placeholder="
                $t('poolEventForm.input.start.timePicker.placeholder')
              "
              v-model="poolevent.front.event_start"
              style="width: 100%;"
            ></el-time-picker>
          </el-form-item>
          <el-form-item
            :label="$t('poolEventForm.input.end.label')"
            prop="front.event_end"
          >
            <el-date-picker
              type="date"
              :placeholder="
                $t('poolEventForm.input.end.datePicker.placeholder')
              "
              v-model="poolevent.front.event_end"
              style="width: 100%;"
            ></el-date-picker>

            <el-time-picker
              :placeholder="
                $t('poolEventForm.input.end.timePicker.placeholder')
              "
              v-model="poolevent.front.event_end"
              style="width: 100%;"
            ></el-time-picker>
          </el-form-item>
          <el-form-item label="Ansprechpartner">
            <el-select
              style="width:100%"
              filterable
              allow-create
              v-model="poolevent.front.asp_event_id"
            >
              <el-option
                v-for="user in supporters"
                :key="user.userId"
                :label="user.fullName"
                :value="user.userId"
              ></el-option>
            </el-select>
          </el-form-item>

          <froala
            id="edit"
            :tag="'textarea'"
            :config="config"
            v-model="poolevent.description.html"
          ></froala>
        </el-card>
      </el-col>

      <el-col :offset="2" :span="11">
        <el-card>
          <el-form-item
            :label="$t('poolEventForm.input.address.label')"
            prop="location.full_address"
          >
            <vue-google-autocomplete
              ref="location"
              id="map"
              class="form-control"
              :placeholder="$t('poolEventForm.input.address.placeholder')"
              v-on:placechanged="getAddressData"
              v-model="poolevent.location.full_address"
            ></vue-google-autocomplete>
          </el-form-item>
          <el-row>
            <el-col :span="16">
              <el-form-item label="street name" prop="location.route">
                <el-input
                  v-model="poolevent.location.route"
                  disabled
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col style="margin-left:10px" :span="7">
              <el-form-item label="number" prop="location.street_number">
                <el-input
                  v-model="poolevent.location.street_number"
                  disabled
                ></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="16">
              <el-form-item label="city" prop="location.locality">
                <el-input
                  v-model="poolevent.location.locality"
                  disabled
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col style="margin-left:10px" :span="7">
              <el-form-item label="plz" prop="location.postal_code">
                <el-input
                  v-model="poolevent.location.postal_code"
                  disabled
                ></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-form-item label="Adressbeschreibung">
            <el-input
              show-word-limit
              placeholder="Please input"
              v-model="poolevent.location.desc"
              maxlength="1000"
              :autosize="{ minRows: 2, maxRows: 10 }"
              type="textarea"
            ></el-input>
          </el-form-item>
        </el-card>

        <el-card title="Application" :expand="true">
          <el-form-item
            :label="$t('poolEventForm.input.applicationStart.label')"
            prop="application_start"
          >
            <el-date-picker
              style="width: 100%;"
              :placeholder="
                $t(
                  'poolEventForm.input.applicationStart.datePicker.placeholder'
                )
              "
              v-model="poolevent.front.application_start"
            ></el-date-picker>

            <el-time-picker
              style="width: 100%;"
              :placeholder="
                $t('poolEventForm.input.applicationEnd.timePicker.placeholder')
              "
              v-model="poolevent.front.application_start"
            ></el-time-picker>
          </el-form-item>
          <el-form-item
            :label="$t('poolEventForm.input.applicationEnd.label')"
            prop="application_end"
          >
            <el-date-picker
              style="width: 100%;"
              :placeholder="
                $t('poolEventForm.input.applicationEnd.datePicker.placeholder')
              "
              v-model="poolevent.front.application_end"
            ></el-date-picker>

            <el-time-picker
              style="width: 100%;"
              :placeholder="
                $t('poolEventForm.input.applicationEnd.timePicker.placeholder')
              "
              v-model="poolevent.front.application_end"
            ></el-time-picker>
          </el-form-item>
          <el-form-item :label="$t('poolEventForm.input.supporterLimit.label')">
            <el-input-number
              v-model="poolevent.front.supporter_lim"
              :min="0"
              :step="1"
            ></el-input-number>
          </el-form-item>
        </el-card>
        <el-card>
          <el-button
            class="vca-button-primary"
            type="primary"
            @click.prevent="() => addPoolEvent('UNRELEASED')"
            style="margin-left:0;margin-right:0;"
            size="mini"
            >CREATE</el-button
          >
          <el-button
            class="vca-button-primary"
            type="info"
            @click.prevent="saveAsDraft('DRAFT')"
            style="margin-left:0;margin-right:0;margin-top:10px"
            size="mini"
            >SAVE AS DRAFT</el-button
          >
          <el-button
            style="margin-left:0;margin-right:0;margin-top:10px"
            class="vca-button-warn"
            type="danger"
            @click.prevent="cancel"
            size="mini"
            >CANCEL</el-button
          >
        </el-card>
      </el-col>
    </el-form>
  </el-container>
</template>

<script>
import VueGoogleAutocomplete from "vue-google-autocomplete";
import "../assets/pool_event_style.css";
import { rules } from "../rules/form";
import { mapActions, mapGetters } from "vuex";

export default {
  name: "PoolEventForm",
  components: {
    VueGoogleAutocomplete
  },
  data() {
    return {
      config: {
        events: {
          initialized: function() {}
        }
      },
      users: [],
      errors: [],
      content: {
        ops: []
      },
      involvedSupporter: [],
      poolevent: {
        front: {
          name: "",
          event_start: "",
          event_end: "",
          application_start: "",
          application_end: "",
          asp_event_id: "",
          website: "",
          supporter_lim: 0,
          active_user_only: "",
          idevent_type: ""
        },
        location: {
          locality: "",
          country: "",
          latitude: "",
          longitude: "",
          postal_code: "",
          route: "",
          street_number: "",
          full_address: ""
        },
        description: {
          text: "",
          html: ""
        }
      },
      isValidForm: "",
      rules,
      types: []
    };
  },
  computed: {
    ...mapGetters(["supporters", "eventtypes", "getPoolEvent"])
  },
  mounted() {
    (async () => {
      this.FETCH_ALL_USERS();
      this.FETCH_EVENTTYPES();
      this.errors = this.$store.state.errors;
      if (this.$route.params.id) {
        await this.GET_POOLEVENT_BY_ID(this.$route.params.id);
        this.fetchPooleventById()
      }
      const {
        locality,
        postal_code,
        route,
        street_number
      } = this.poolevent.location;
      this.poolevent.location.full_address = route
        ? `${route} ${street_number}, ${postal_code} ${locality}`
        : "";
    })();
  },
  methods: {
    ...mapActions([
      "POST_POOLEVENT",
      "FETCH_ALL_USERS",
      "PUT_POOLEVENT",
      "FETCH_EVENTTYPES",
      "GET_POOLEVENT_BY_ID"
    ]),
    addPoolEvent() {
      if (this.$route.params.id == undefined) {
        this.submitForm();
        if (this.isValidForm) {
          this.poolevent.front.event_start = new Date().getTime(
            this.poolevent.front.event_start
          );
          this.poolevent.front.event_end = new Date().getTime(
            this.poolevent.front.event_end
          );
          this.poolevent.front.application_start = new Date().getTime(
            this.poolevent.front.application_start
          );
          this.poolevent.front.application_end = new Date().getTime(
            this.poolevent.front.application_end
          );
          this.POST_POOLEVENT(this.poolevent);
        }
      } else if (this.$route.params.id != undefined) {
        this.PUT_POOLEVENT({
          poolevent: this.poolevent,
          id: this.$route.params.id
        });
      }
    },
    cancel() {
      this.$router.push("/waves");
    },
    submitForm() {
      this.$refs["poolevent"].validate(valid => {
        if (valid) {
          this.isValidForm = valid;
        } else {
          this.isValidForm = valid;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    getAddressData(addressData) {
      this.poolevent.location.locality = addressData.locality;
      this.poolevent.location.postal_code = addressData.postal_code;
      this.poolevent.location.route = addressData.route;
      this.poolevent.location.street_number = addressData.street_number;
      this.poolevent.location.latitude = addressData.latitude.toString();
      this.poolevent.location.longitude = addressData.longitude.toString();
      const {
        locality,
        postal_code,
        route,
        street_number
      } = this.poolevent.location;
      this.poolevent.location.full_address = `${route} ${street_number}, ${postal_code} ${locality}`;
    },
    selectSupporter(supporter) {
      this.involvedSupporter = supporter;
    },
    async fetchPooleventById() {
      const { location, description, ...front } = this.getPoolEvent;
      this.poolevent.description.html = description.html;
      this.poolevent.description.text = description.text;
      this.poolevent.location.route = location.route;
      this.poolevent.location.street_number = location.street_number;
      this.poolevent.location.postal_code = location.postal_code;
      this.poolevent.location.locality = location.locality;
      this.poolevent.location.desc = location.desc;
      this.poolevent.location.latitude = location.latitude;
      this.poolevent.location.longitude = location.longitude;
      this.poolevent.location.full_address = location.full_address;
      this.poolevent.front.name = front.event_name;
      this.poolevent.front.event_start = new Date(front.event_start);
      this.poolevent.front.event_end = new Date(front.event_end);
      this.poolevent.front.application_start = new Date(
        front.application_start
      );
      this.poolevent.front.application_end = new Date(front.application_end);
      this.poolevent.front.website = front.website;
      this.poolevent.front.idevent_type = front.idevent_type;
      this.poolevent.front.asp_event_id = front.asp_event_id.id;
      this.poolevent.front.supporter_lim = front.supporter_lim;
    }
  }
};
</script>

<style scoped>
#logo {
  display: none;
}
</style>
