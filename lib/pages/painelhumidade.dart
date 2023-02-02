import 'dart:io';
import 'package:farmfitmobile/pages/contants.dart';
import 'package:farmfitmobile/pages/painel.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:farmfitmobile/pages/proximas_temperaturas.dart';
import 'package:farmfitmobile/services/previsao_service.dart';
import 'package:farmfitmobile/models/previsao_hora.dart';
import 'package:flutter/foundation.dart';
import 'package:farmfitmobile/pages/painel.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class painelhumidade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return appbar2();
  }
}

String valor = "2";

class conteudopainel2 extends StatelessWidget {
  String cdate1 = DateFormat("EEEEE, dd, yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        cabecalho2(),
        Padding(padding: EdgeInsets.all(10)),
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                height: 670,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(30)),
              SizedBox(
                height: 41,
                width: double.infinity,
                child: Container(
                  child: Center(
                    child: Text(
                      cdate1,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
              dados2(),
            ],
          ),
        ),
      ],
    );
  }
}

class dados2 extends StatefulWidget {
  const dados2({Key? key}) : super(key: key);
  @override
  State<dados2> createState() => _dados2State();
}

class _dados2State extends State<dados2> {
  late List<PrevisaoHora> ultimasPrevisoes;
  @override
  void initState() {
    super.initState();
    PrevisaoService service = PrevisaoService();
    ultimasPrevisoes = service.recuperarUltimasPrevisoes();
    conectar();
  }

  bool liga = false;
  bool desabilitar = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Umidade do solo",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          /*
          Switch(
              value: liga,
              onChanged: (value) {
                liga = value;
                setState(() {
                  conectar();
                });
              }),
              */
          Padding(padding: EdgeInsets.all(60)),
          Container(
            child: Text(
              "Umidade $valor %",
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
                fontFamily: 'Inter',
              ),
            ),
          ),
          Container(
            height: 60,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
              color: int.parse(valor) < 20 || int.parse(valor) > 60
                  ? Colors.red
                  : int.parse(valor) > 20 || int.parse(valor) < 60
                      ? Colors.green
                      : Colors.grey,
            ),
          ),
          Padding(padding: EdgeInsets.all(60)),
          Text(
            "LEGENDA:",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 19,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
          Text(
            "Cor vermelha = UMIDADE NÃO IDEAL",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 19,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
          Padding(padding: EdgeInsets.all(2)),
          Text(
            "Cor verde = UMIDADE IDEAL",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 19,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
          Padding(padding: EdgeInsets.all(2)),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextButton(
              onPressed: (() {
                if (valor == "1") {
                  Navigator.popAndPushNamed(context, "painelhumidade");
                }
              }),
              child: Text(
                "Reload",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final client = MqttServerClient('test.mosquitto.org', '');

  var pongCount = 0; // Pong counter

  Future<int> conectar() async {
    /// A websocket URL must start with ws:// or wss:// or Dart will throw an exception, consult your websocket MQTT broker
    /// for details.
    /// To use websockets add the following lines -:
    /// client.useWebSocket = true;
    /// client.port = 80;  ( or whatever your WS port is)
    /// There is also an alternate websocket implementation for specialist use, see useAlternateWebSocketImplementation
    /// Note do not set the secure flag if you are using wss, the secure flags is for TCP sockets only.
    /// You can also supply your own websocket protocol list or disable this feature using the websocketProtocols
    /// setter, read the API docs for further details here, the vast majority of brokers will support the client default
    /// list so in most cases you can ignore this.
    /// Set logging on if needed, defaults to off
    client.logging(on: true);

    /// Set the correct MQTT protocol for mosquito
    client.setProtocolV311();

    /// If you intend to use a keep alive you must set it here otherwise keep alive will be disabled.
    client.keepAlivePeriod = 20;

    /// The connection timeout period can be set if needed, the default is 5 seconds.
    client.connectTimeoutPeriod = 2000; // milliseconds

    /// Add the unsolicited disconnection callback
    client.onDisconnected = onDisconnected;

    /// Add the successful connection callback
    client.onConnected = onConnected;

    /// Add a subscribed callback, there is also an unsubscribed callback if you need it.
    /// You can add these before connection or change them dynamically after connection if
    /// you wish. There is also an onSubscribeFail callback for failed subscriptions, these
    /// can fail either because you have tried to subscribe to an invalid topic or the broker
    /// rejects the subscribe request.
    client.onSubscribed = onSubscribed;

    /// Set a ping received callback if needed, called whenever a ping response(pong) is received
    /// from the broker.
    client.pongCallback = pong;

    /// Create a connection message to use or use the default one. The default one sets the
    /// client identifier, any supplied username/password and clean session,
    /// an example of a specific one below.
    final connMess = MqttConnectMessage()
        .withClientIdentifier('Mqtt_MyClientUniqueId')
        .withWillTopic('FarmFIT') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    print('EXAMPLE::Mosquitto client connecting....');
    client.connectionMessage = connMess;

    /// Connect the client, any errors here are communicated by raising of the appropriate exception. Note
    /// in some circumstances the broker will just disconnect us, see the spec about this, we however will
    /// never send malformed messages.
    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      // Raised by the client when connection fails.
      print('EXAMPLE::client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      // Raised by the socket layer
      print('EXAMPLE::socket exception - $e');
      client.disconnect();
    }

    /// Check we are connected
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('EXAMPLE::Mosquitto client connected');
    } else {
      /// Use status here rather than state if you also want the broker return code.
      print(
          'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
      exit(-1);
    }

    /// Ok, lets try a subscription
    print('EXAMPLE::Subscribing to the test/lol topic');
    const topic = 'FarmFIT'; // Not a wildcard topic
    client.subscribe(topic, MqttQos.atMostOnce);

    /// The client has a change notifier object(see the Observable class) which we then listen to to get
    /// notifications of published updates to each subscribed topic.
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      String teste;
      teste = pt;
      if (int.parse(teste) > 0 && int.parse(teste) < 110) {
        valor = pt;
      }
      
      setState(() {});

      /// The above may seem a little convoluted for users only interested in the
      /// payload, some users however may be interested in the received publish message,
      /// lets not constrain ourselves yet until the package has been in the wild
      /// for a while.
      /// The payload is a byte buffer, this will be specific to the topic
      print(
          'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });

    /// If needed you can listen for published messages that have completed the publishing
    /// handshake which is Qos dependant. Any message received on this stream has completed its
    /// publishing handshake with the broker.
    client.published!.listen((MqttPublishMessage message) {
      print(
          'EXAMPLE::Published notification:: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
    });

    /// Lets publish to our topic
    /// Use the payload builder rather than a raw buffer
    /// Our known topic to publish to
    const pubTopic = 'FarmFIT';
    final builder = MqttClientPayloadBuilder();
    builder.addString('Hello from mqtt_client');

    /// Subscribe to it
    print('EXAMPLE::Subscribing to the FarmFIT topic');
    client.subscribe(pubTopic, MqttQos.exactlyOnce);

    /// Publish it
    print('EXAMPLE::Publishing our topic');
    client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);

    /// Ok, we will now sleep a while, in this gap you will see ping request/response
    /// messages being exchanged by the keep alive mechanism.
    print('EXAMPLE::Sleeping....');
    await MqttUtilities.asyncSleep(60);

    /// Finally, unsubscribe and exit gracefully
    print('EXAMPLE::Unsubscribing');
    client.unsubscribe(topic);

    /// Wait for the unsubscribe message from the broker if you wish.
    await MqttUtilities.asyncSleep(2);
    print('EXAMPLE::Disconnecting');
    client.disconnect();

    valor = "1";
    setState(() {});
    print('EXAMPLE::Exiting normally');
    return 0;
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    print('EXAMPLE::Subscription confirmed for topic $topic');
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (client.connectionStatus!.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    } else {
      print(
          'EXAMPLE::OnDisconnected callback is unsolicited or none, this is incorrect - exiting');
      exit(-1);
    }
    if (pongCount == 3) {
      print('EXAMPLE:: Pong count is correct');
    } else {
      print('EXAMPLE:: Pong count is incorrect, expected 3. actual $pongCount');
    }
  }

  /// The successful connect callback
  void onConnected() {
    print(
        'EXAMPLE::OnConnected client callback - Client connection was successful');
  }

  /// Pong callback
  void pong() {
    print('EXAMPLE::Ping response client callback invoked');
    pongCount++;
  }
}

class appbar2 extends StatefulWidget {
  @override
  State<appbar2> createState() => _appbar2State();
}

class _appbar2State extends State<appbar2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "homescreen");
                },
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                active: true,
                onPressed: () {
                  Navigator.popAndPushNamed(context, "painel");
                },
                icon: Icons.analytics_outlined,
                text: 'Painel',
              ),
              GButton(
                icon: Icons.group,
                text: 'Time',
                onPressed: () {
                  Navigator.popAndPushNamed(context, "time");
                },
              ),
            ],
            selectedIndex: 1,
          ),
        ),
      ),
      backgroundColor: Color(0xFF035AA6),
      body: conteudopainel2(),
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "FarmFit.",
            style: TextStyle(fontSize: 25),
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class cabecalho2 extends StatefulWidget {
  @override
  State<cabecalho2> createState() => _cabecalho2State();
}

class _cabecalho2State extends State<cabecalho2> {
  int? selectedCategory = 1;

  List<String> categories = ["Clima", "Umidade do solo"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index, context),
        ),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: (() {
          setState(() {
            selectedCategory = index;
            if (selectedCategory == 1) {
              selectedCategory = 1;
              if (valor == "1") {
                Navigator.popAndPushNamed(context, "painelhumidade");
              }
            } else if (selectedCategory == 2) {
              Navigator.popAndPushNamed(context, "/");
            } else {
              Navigator.popAndPushNamed(context, "painel");
            }
          });
        }),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: index == selectedCategory
                        ? kTextColor
                        : Colors.black.withOpacity(0.4),
                  ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              height: 6,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedCategory
                    ? kSecondaryColor
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
