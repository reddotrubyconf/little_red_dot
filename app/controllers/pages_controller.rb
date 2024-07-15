class PagesController < ApplicationController
  def landing
    @speakers = FeaturedSpeaker.all.order(display_order: :asc)
    @days = current_conference.agenda["schedule"]&.map do |day|
      day.sort_by { |event| event["time"] }
    end
    @sponsors = [
      {
        url: "https://www.coingecko.com/",
        image: "coin_gecko.png",
        write_up: "CoinGecko is the world’s largest independent cryptocurrency data aggregator with over 14,000+ different cryptoassets tracked across more than 1,000+ exchanges worldwide.",
      },
      {
        url: "https://www.tech.gov.sg/",
        image: "stack.png",
        write_up: (
          <<~HTML
          The <a class="underline" href="https://www.meetup.com/stack-by-govtech-singapore/">STACK Community by GovTech</a> is the friendly SG Gov tech community for techies and enthusiasts! We lead conversations in tech for learning, knowledge exchange, and the adoption of digital solutions within the public service. Through casual after-work Meetups and networking for tech professionals to government-led conferences, we aspire to use tech to improve the lives of everyday Singaporeans. Our aim is to collectively build a Smart Nation on the Singapore Government Tech Stack. Join our community of members from across the public sector and industry now! Be a part of the STACK Meetup community and <a class="underline" href="https://go.gov.sg/stacktelegram">STACK Telegram group</a> to receive latest updates on our initiatives.
          HTML
        ).html_safe
      },
      {
        url: "https://www.appsignal.com",
        image: "appsignal.svg",
        write_up: "AppSignal helps your team find bugs and slow actions before the rest of the world finds out. Error tracking, performance monitoring, custom metrics, host monitoring, logging, uptime, public status pages, and more, starting at $23 monthly. ISO 27001 certified and GDPR & HIPAA compliant.",
      },
      {
        url: "https://www.ascenda.com",
        image: "ascenda.png",
        write_up: "Ascenda is a global leader in providing innovative loyalty solutions equipping banks and fintechs to deploy world-class rewards effortlessly. Our technology simplifies loyalty programs, delivering exceptional value, customer growth, reduced churn, and ease of use. We've helped banks like Amex, SBI, ANZ, Capital One, and fintechs like Brex, Ramp, and Robinhood launch powerful rewards strategies.",
      }
    ]
  end

  def login; end

  def me; end
end
