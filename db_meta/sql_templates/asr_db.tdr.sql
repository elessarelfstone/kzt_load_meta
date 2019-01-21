select
       {rdt_id}
||';'||{server_id}
||';'||t.source_file_id
||';'||t.id
||';'||t.source_group_id
||';'||t.service_date
||';'||t.device
||';'||t.detail
||';'||t.service_count
||';'||t.service_count1
||';'||t.service_count2
||';'||t.service_count3
||';'||t.order_date
||';'||t.report_date_id
||';'||t.town_id
||';'||t.device_group_id
||';'||t.abonent_id
||';'||t.abonent_group_id
||';'||t.detail_type_id
||';'||t.tariff_type_id
||';'||t.service_pack_type_id
||';'||t.factor_type_id
||';'||t.date_factor_type_id
||';'||t.nds_type_id
||';'||t.discount_type_id
||';'||t.service_count_group_id
||';'||t.debit
||';'||t.tdr_group_id
||';'||t.bill_type_id
||';'||t.dbill_type_id
||';'||t.bill_id
||';'||t.vat_rate
||';'||t.personal_discount
||';'||t.discount_amt
||';'||t.day_type
||';'||t.period_name
||';'||t.rpr9_usage_interface_id
||';'||t.event_id
||';'||t.subscriber_id
||';'||t.user_name
||';'||sysdate
from db.tdr t, db.bill b
where t.bill_id=b.id and
      t.report_date_id=b.report_date_id and
      b.report_date_id=extract(month from dtbegin) and
      t.order_date between to_date({dtbegin}, 'dd.mm.yyyy')
        and to_date({dtend}, 'dd.mm.yyyy') + 1 - 1/(86400)