class OrderResponseModel {
  int _status;
  String _message;
  List<_Order> _orders = [];

  OrderResponseModel.fromJson(Map<String, dynamic> parsedJson) {
    _status = parsedJson['status'];
    _message = parsedJson['message'];
    List<_Order> temp = [];
    for (int i = 0; i < parsedJson['data'].length; i++) {
      _Order order = _Order(parsedJson['data'][i]);
      temp.add(order);
    }
    _orders = temp;
  }

  List<_Order> get orders => _orders;

  int get status => _status;
  String get message => _message;
}

class _Order {
  String _id;
  String _delivery_date;
  String _delivery_time;
  String _status;
  String _store_name;
  int _store_contact_no;
  String _store_contact_name;
  String _customer_name;
  int _customer_mobile;
  String _customer_email;
  List<_Item> _items = [];
  // int _total;
  // int _subtotal;
  // String _payment_mode;

  _Order(order) {
    print(order['store']['phone']);
    _id = order['_id'];
    _delivery_date = order['delivery']['date'];
    _delivery_time = order['delivery']['time'];
    _status = order['status'];
    _store_name = order['store']['name'];
    _store_contact_no = order['store']['phone'];
    _store_contact_name = order['store']['contactPerson'];
    _customer_name = order['user']['name'];
    _customer_mobile = order['user']['mobile'];
    _customer_email = order['user']['email'];
    // _total = order['total'];
    // _subtotal = order['subTotal'];
    // _payment_mode = order['paymentMode'];

    for (int i = 0; i < order['items'].length; i++) {
      Map<String, dynamic> tmp = {
        'quantity': order['items'][i]['quantity'],
         'item_name': 'The'
      };

      _items.add(_Item(tmp));
    }
  }

  String get id => _id;
  String get delivery_date => _delivery_date;
  String get delivery_time => _delivery_time;
  String get status => _status;
  String get store_name => _store_name;
  int get store_contact_no => _store_contact_no;
  String get store_contact_name => _store_contact_name;
  String get customer_name => _customer_name;
  int get customer_mobile => _customer_mobile;
  String get customer_email => _customer_email;
  List<_Item> get items => _items;

  // int get total => _total;
  // int get subtotal => _subtotal;
  // String get payment_mode => _payment_mode;

}

class _Item {
  int _quantity;
  String _item_name;

  _Item(Map<String, dynamic> item) {
    _quantity = item['quantity'];
    _item_name = item['item_name'];
  }

  int get quantity => _quantity;
  String get item_name => _item_name;
}
