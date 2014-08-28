t1 = Topic.create(name: 'topic 1')
t2 = Topic.create(name: 'topic 2')

Guide.create(name: 'validates', explanation: 'Checks...', topic_id: t1.id)
Guide.create(name: 'thing', explanation: 'Does a thing...', topic_id: t1.id)
Guide.create(name: 'all', explanation: 'Comes up with...', topic_id: t1.id)
Guide.create(name: 'where', explanation: 'Finds a bunch...', topic_id: t2.id)
Guide.create(name: 'security', explanation: 'How to lock...', topic_id: t2.id)

Contributor.create(name: 'steve', email: 'steve@example.com', password: 's')
Contributor.create(name: 'grace', email: 'grace@example.com', password: 'g')
Contributor.create(name: 'adam', email: 'adam@example.com', password: 'a')