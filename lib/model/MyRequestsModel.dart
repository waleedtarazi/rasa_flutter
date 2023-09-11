class Requestt {
  final String date;
  final String user_name;
  final String doctor_name;
  final String status;
  final String description;
  // ignore: non_constant_identifier_names
  final int request_id;

  Requestt(this.request_id, this.date, this.user_name, this.doctor_name,
      this.status, this.description);
}
