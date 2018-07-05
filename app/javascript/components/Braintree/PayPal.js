// @flow
import { Component } from 'react';
import paypal from 'braintree-web/paypal';
import type {
  BraintreeError,
  Client,
  PayPal as IPayPal,
  PayPalOptions,
} from 'braintree-web';

type OwnProps = {
  currency: string,
  amount: number,
  client: Client,
  vault: boolean,
  onInit?: () => void,
  onFailure?: (data: any) => void,
};

type OwnState = {
  paypalInstance: ?IPayPal,
  disabled: boolean,
};

export default class PayPal extends Component<OwnProps, OwnState> {
  constructor(props: OwnProps) {
    super(props);
    this.state = {
      paypalInstance: null,
      disabled: true,
    };
  }

  componentDidMount() {
    this.createPayPalInstance(this.props.client);
  }

  componentWillReceiveProps(newProps: OwnProps) {
    if (newProps.client !== this.props.client) {
      this.createPayPalInstance(newProps.client);
    }
  }

  createPayPalInstance(client: Client) {
    paypal.create({ client }, this.onPayPalCreate);
  }

  onPayPalCreate = (error: BraintreeError, paypalInstance: any) => {
    if (error) {
      throw error;
    }

    this.setState({ paypalInstance, disabled: false }, () => {
      if (this.props.onInit) {
        this.props.onInit();
      }
    });
  };

  componentWillUnmount() {
    if (this.state.paypalInstance) {
      this.state.paypalInstance.teardown();
    }
  }

  flow(): $PropertyType<PayPalOptions, 'flow'> {
    if (this.props.vault) return 'vault';
    return 'checkout';
  }

  tokenizeOptions(): PayPalOptions {
    const { amount, currency, vault } = this.props;
    if (vault) {
      return { flow: 'vault' };
    }
    return { flow: 'checkout', amount, currency };
  }

  submit() {
    const paypalInstance = this.state.paypalInstance;
    return new Promise((resolve, reject) => {
      if (!paypalInstance) return reject();

      paypalInstance.tokenize(
        this.tokenizeOptions(),
        (error: ?BraintreeError, payload: PayPalTokenizePayload) => {
          if (error) return reject(error);
          resolve(payload);
        }
      );
    });
  }

  render = () => null;
}
