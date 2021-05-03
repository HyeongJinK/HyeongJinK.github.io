---
sort: 5
---

# Mybatis 중첩 collection and association

```xml
    <resultMap id="stationAll" type="com.neibus.subway.dto.all.SubwayAllDto">
        <id property="cityId" column="city_id" />
        <result property="cityName" column="city_name" />
        <collection property="stationList" ofType="com.neibus.subway.dto.all.SubwayAllStation" columnPrefix="s_">
            <id property="stationId" column="station_id" />
            <result property="stationName" column="station_name" />
            <collection property="stationTypeList" ofType="com.neibus.subway.dto.all.SubwayAllStationType"
                        columnPrefix="st_">
                <result property="stationType" column="station_type" />
                <result property="imageX" column="image_x" />
                <result property="imageY" column="image_y" />
            </collection>
            <collection property="stationDetails" ofType="com.neibus.subway.dto.all.SubwayAllStationDetail"
                        columnPrefix="sd_">
                <id property="stationDetailId" column="station_detail_id" />
                <result property="lineId" column="line_id" />
                <result property="lineName" column="line_name" />
                <result property="lat" column="lat" />
                <result property="lng" column="lng" />
            </collection>
        </collection>
    </resultMap>

    <select id="findAll" parameterType="com.neibus.common.parameter.Parameter" resultMap="stationAll">
        SELECT
            c.city_id,
            c.city_name,
            s.station_id as s_station_id,
            s.station_name as s_station_name,
            st.station_type as s_st_station_type,
            st.image_x as s_st_image_x,
            st.image_y as s_st_image_y,
            sl.station_id as s_sd_station_id,
            sl.station_detail_id as s_sd_station_detail_id,
            sl.line_id as s_sd_line_id,
            sl.line_name as s_sd_line_name,
            sl.lat as s_sd_lat,
            sl.lng as s_sd_lng
        FROM
            subway.city as c
        LEFT JOIN   subway.station as s
        ON c.city_id = s.city_id
        LEFT JOIN   subway.station_type as st
        ON s.station_id = st.station_id
        LEFT JOIN (
            SELECT
                sl.station_id,
                sl.station_detail_id,
                sl.line_id,
                l.line_name,
                si.lat,
                si.lng
            FROM
                subway.station_line as sl
            LEFT JOIN subway.line as l
            ON sl.line_id = l.line_id
            LEFT JOIN subway.station_info as si
            ON sl.station_detail_id = si.station_detail_id
        ) as sl
        ON s.station_id = sl.station_id
        <where>
            <if test="cityId != null">
                c.city_id = #{cityId}
            </if>
        </where>
    </select>
```