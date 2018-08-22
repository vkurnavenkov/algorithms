const NoClassSingleton = {
  _instance: null,
  get instance() {
    if (!this._instance) {
      this._instance = {
        singletonMethod() {
          return 'singletonMethod';
        },

        _type: 'NoClassSingleton',

        get type() {
          return this._type;
        },

        set type(value) {
          this._type = value;
        }
      };
    }
    return this._instance;
  }
};
