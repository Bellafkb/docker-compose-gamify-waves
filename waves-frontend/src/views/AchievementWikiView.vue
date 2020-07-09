<template>
  <div class="wiki-container" style="margin:auto">
    <el-row>
      <h2>Badges</h2>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laborum neque aut facilis perspiciatis debitis sapiente sunt accusamus commodi in. Optio aliquid alias placeat! Corrupti esse in harum dolores cumque eaque voluptatem repellat corporis modi animi ut voluptatibus, fuga sequi dolorum consequatur quas totam officia odio maxime repudiandae ipsa. Sed laudantium impedit eos vel illo provident magni ex. Aliquam non est aliquid debitis delectus laboriosam nobis error dolorem! Debitis pariatur, explicabo assumenda nam fuga odit molestias ea sit vero repellat iusto iste inventore provident corporis ut repellendus error, expedita vel? Odit, temporibus optio sunt facere dolorum fuga modi quas ab quia, officiis labore cumque neque voluptatem? Incidunt repellendus aut consectetur exercitationem, quos aperiam ea necessitatibus veniam itaque saepe ut fugit iure ratione repellat dolorem. Autem saepe voluptatum minus quia quae sed obcaecati, amet atque natus nam deleniti placeat qui! Et animi inventore, necessitatibus eaque eos porro ducimus error quasi commodi ipsa delectus, ratione libero nesciunt qui! Necessitatibus ipsum consequuntur ad aperiam quod earum ratione provident ducimus quibusdam cum doloribus, minima enim veritatis corrupti similique sequi natus perferendis quis ipsa odio dignissimos. Itaque eveniet aperiam debitis magni, eos earum modi, amet id quidem unde autem hic nulla qui laborum sequi animi laudantium.</p>
      <h3>Can you create a new trophy for me / my Cew?</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus, fuga. Necessitatibus sint fugit molestias, non tempore voluptas quibusdam, nostrum et placeat consequuntur quos impedit minima laudantium, distinctio quia similique iusto unde porro. Totam ipsam harum optio dicta, mollitia earum veritatis. Libero modi molestiae similique a fugiat aut reprehenderit sint. Fuga molestias labore est ullam porro soluta vero fugit, corporis pariatur perspiciatis perferendis suscipit, nostrum inventore officiis harum quisquam provident a dolorem natus cumque dignissimos. Eum modi iure autem tempora ad corporis quae dolorum ratione impedit alias. Quae deleniti autem, ad, maiores, delectus fugit velit corporis aut temporibus voluptate ea vitae?</p>
      <h3>How can I get a trophy?</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi voluptate impedit laudantium maxime expedita magni explicabo itaque vitae quisquam! Cumque tempore praesentium, laboriosam repellendus eaque beatae veniam qui eveniet, quae aspernatur harum fugiat perferendis dicta ex dolorem omnis recusandae fugit quaerat id doloremque ipsam deserunt temporibus! Ratione consequuntur in illo.</p>

      <h3></h3>
    </el-row>
    <el-row>
      <NormalBadges :badges="badges" />
    </el-row>
    <el-row>
    </el-row>
    <el-row>
    </el-row>
  </div>
</template>

<script>
import NormalBadges from "../components/NormalBadges";

import Axios from "axios";

export default {
  name: "AchievementWikiView",
  components: {
    NormalBadges,
  },
  data() {
    return {
      config: "",
      badges: ""
    };
  },
  async mounted() {
    const { data } = await Axios.get("/waves/api/v1/badge", {
      headers: {
        Authorization: `Bearer ${this.$cookies.get("access_token")}`
      }
    });
    this.badges = data.data;
  }
};
</script>

<style>
.wiki-container {
  width: 90%;
}

@media only screen and (min-width: 768px) {
  .wiki-container {
    width: 60%;
  }
}
</style>