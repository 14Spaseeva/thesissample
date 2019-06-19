package main.examples;

import main.bdd.CommandLibable;
import main.bdd.annotation.Recieve;
import main.bdd.annotation.Send;

public class CommandLib extends CommandLibable {

    @Send(text = "Ignition On")
    public void ignitionOn() {
        xlOpenDriver();
        xlOpenPort();
    }

    @Send(text = "Ignition Off")
    public void ignitionOff() {
        xlDeactivateChannel();
        xlClosePort();
        xlCloseDriver();
    }


@Send(text = "request [param1]")
public void sendRequest(String param1) {
    xlFrTransmit(HexUtil.fromStringtoHexArray(param1));
}

@Recieve(text = "response [param1]")
public void recieveResponse(String param1) {
    xlFrReceive(HexUtil.fromStringtoHexArray(param1));
}

}
