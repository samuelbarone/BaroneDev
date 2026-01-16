/**
 * A basic event broker for lightning web components
 */
const events = {};

/**
 * Registers a callback for an event
 * @param {string} eventName - Name of the event to listen for.
 * @param {function} callback - Function to invoke when said event is fired.
 * @param {string} id - The id to be passed as a filter (most commonly the recordId).
 */
const registerListener = (eventName, callback, id) => {
    // Checking that the listener has a recordId property. We rely on that property for filtering purpose in fireEvent()
    if (!id) {
        throw new Error(
            'eventBroker needs a id to ensure filtering events'
        );
    }

    if (!events[eventName]) {
        events[eventName] = [];
    }
    const duplicate = events[eventName].find(listener => {
        return listener.callback === callback && listener.id === id;
    });
    if (!duplicate) {
        events[eventName].push({ callback, id });
    }
};

/**
 * Unregisters a callback for an event
 * @param {string} eventName - Name of the event to unregister from.
 * @param {function} callback - Function to unregister.
 * @param {string} id - The id to be passed as a filter (most commonly the recordId).
 */
const unregisterListener = (eventName, callback, id) => {
    if (events[eventName]) {
        events[eventName] = events[eventName].filter(
            listener =>
                listener.callback !== callback || listener.id !== id
        );
    }
};


/**
 * Unregisters all event listeners bound to an object.
 * @param {string} id - All the callbacks bound to this id will be removed.
 */
const unregisterAllListeners = id => {
    Object.keys(events).forEach(eventName => {
        events[eventName] = events[eventName].filter(
            listener => listener.id !== id
        );
    });
};

/**
 * Fires an event to listeners.
 * @param {object} pageRef - Reference of the page that represents the event scope.
 * @param {string} eventName - Name of the event to fire.
 * @param {*} payload - Payload of the event to fire.
 */
const fireEvent = (id, eventName, payload) => {
    if (events[eventName]) {
        const listeners = events[eventName];
        listeners.forEach(listener => {
            if (listener.id === id) {
                try {
                    listener.callback.call(listener.id, payload);
                } catch (error) {
                    // fail silently
                }
            }
        });
    }
};

export {
    registerListener,
    unregisterListener,
    unregisterAllListeners,
    fireEvent
};