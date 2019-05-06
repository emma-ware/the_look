view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    link: {
      label: "Website"
      url: "http://www.google.com/search?q={{ value | encode_uri }}+clothes"
      icon_url: "http://www.google.com/s2/favicons?domain=www.{{ value | encode_uri }}.com"
    }
    link: {
      label: "View in Salesforce"
      url: "https://looker.my.salesforce.com/{{ id._value }}"
      icon_url: "https://www.google.com/s2/favicons?domain=www.salesforce.com"
    }

    link: {
      label: "Add Contact Role in Salesforce"
      url: "https://looker.my.salesforce.com/02Z/e?parentId={{ id._value }}"
      icon_url: "https://www.google.com/s2/favicons?domain=www.salesforce.com"
    }

    link: {
      label: "Create New Opportunity"
      url: "https://looker.my.salesforce.com/006/e?accid={{ id._value }}"
      icon_url: "https://www.google.com/s2/favicons?domain=www.salesforce.com"
    }

    link: {
      label: "Customer Lookup for \"{{ value }}\""
      url: "/dashboards/38?Account%20Name=%22{{ value | urlencode }}%22"
      icon_url: "https://looker.com/favicon.ico"
    }

    link: {
      label: "News for \"{{ value }}\""
      #tbm=nws&q={{ value | urlencode }}
      url: "https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8"
      icon_url: "https://www.google.com/favicon.ico"
    }

    link: {
      label: "Partner Lookup for \"{{ value }}\""
      url: "/dashboards/1152?Partner%20Name=%22{{ value | urlencode }}%22"
      icon_url: "https://looker.com/favicon.ico"
    }
    link: {
      label: "Slack Channel"
      url: "https://looker.slack.com/app_redirect?channel={{ id._value }}"
      icon_url: "https://a.slack-edge.com/814a8/marketing/img/meta/favicon.ico"
    }
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
