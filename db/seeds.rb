# frozen_string_literal: true

if User.count.zero?

  aprohodite = FactoryBot.create(:user, name: 'Aphrodite')
  apollo     = FactoryBot.create(:user, name: 'Apollo')
  demeter    = FactoryBot.create(:user, name: 'Demeter')
  hades      = FactoryBot.create(:user, name: 'Hades')
  hermes     = FactoryBot.create(:user, name: 'Hermes')
  poseidon   = FactoryBot.create(:user, name: 'Poseidon')
  zeus       = FactoryBot.create(:user, name: 'Zeus', email: 'zeus@dinjas.com')

  users = User.all

  today = Date.today

  Timecop.freeze(today.advance(years: -500, days: 211))
  %w[Amped
     Big\ Zap
     Sparkler
     Juicy\ Juice
     Shining
     Aurora\ Bora
     Blue\ Light\ Special
     Ziggy\ Zag
     Silent\ but\ Deadly
     Crooked\ Line
     Quick\ Flash].each_with_index do |name, i|
    PaperTrail.request.whodunnit = zeus.id
    FactoryBot.create(:lightning,
                      name:       name,
                      strike_at:  today.advance(months: i, weeks: i + 1),
                      intensity: rand(1..10),
                      bolt_type: Lightning::BOLT_TYPES.sample,
                      charge:     Lightning::CHARGES.sample)
  end
  Timecop.return

  l = Lightning.find_by(name: 'Juicy Juice')

  Lightning.all.each_with_index do |zap, i|
    next if zap.eql?(l)

    Timecop.freeze(Date.today.advance(years: -57 * i, days: 11 * i))
    PaperTrail.request.whodunnit = users.sample.id

    zap.update!(intensity: (i * 11) % 10 + 1)

    Timecop.return
  end

  PaperTrail.request.whodunnit = apollo.id
  Timecop.freeze(Date.today.advance(years: -300, days: -56))
  l.intensity = 10
  l.strike_at = Date.today.advance(years: 50)
  l.bolt_type = Lightning::BOLT_TYPES.last
  l.charge    = 'Positive'
  l.save!
  Timecop.return

  PaperTrail.request.whodunnit = demeter.id
  Timecop.freeze(Date.today.advance(years: -203, days: 213))
  l.strike_at = Date.today.advance(years: 80, days: 124)
  l.bolt_type = Lightning::BOLT_TYPES.third
  l.save!
  Timecop.return

  PaperTrail.request.whodunnit = aprohodite.id
  Timecop.freeze(Date.today.advance(years: -173, days: -111))
  l.intensity = 8
  l.strike_at = Date.today.advance(years: 8000)
  l.save!
  Timecop.return

  PaperTrail.request.whodunnit = hermes.id
  Timecop.freeze(Date.today.advance(years: -102, days: -50))
  l.intensity = 1
  l.charge = 'Negative'
  l.save!
  Timecop.return

  PaperTrail.request.whodunnit = hades.id
  Timecop.freeze(Date.today.advance(years: -56, days: 88))
  l.bolt_type = Lightning::BOLT_TYPES.second
  l.save!
  Timecop.return

  PaperTrail.request.whodunnit = poseidon.id
  Timecop.freeze(Date.today.advance(years: -15, days: 50))
  l.intensity = 8
  l.save!
  Timecop.return

end
