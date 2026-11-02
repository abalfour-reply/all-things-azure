# <Topic Azure Service Bus> 

## Summary

A managed message broker, use when you have multiple applications or services that need to communicate reliably without being directly connected to each other.

Think of it like a reliable post office:
- Stores messages durably
- Delivers message reliabily
- Retries failed deliveries
- Allows systems to work independtly
- Handles spikes in workloads

Two types of service buses

__Queues__
First in First Out Structure. Messages are timestamped etc. Usually a n:1 relationship, messages come in and go to a designated location.

__Topics/Subscription__
A user/node publishes to a topic. From that topic you can have multiple subscribers that all attach to the topic and works just like a queue.