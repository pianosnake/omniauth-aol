OmniAuth AOL
==============

This gem contains the OmniAuth AOL strategy that allows authentication with AOL Instant Messenger (AIM)/AOL Mail credentials.

How To Use It
-------------

In Rails add the gem to your `Gemfile`:

    gem "omniauth-aol"

Add the following to your `config/initializers/omniauth.rb`:

    provider :aol, ENV['AOL_KEY'], ENV['AOL_SECRET'], :scope => 'email'

Get your AOL_KEY and AOL_SECRET from dev.aol.com or by emailing identitysupport@teamaol.com. Put these values in application.rb.

Visit the following URL to make sure it works

	http://localhost:3000/auth/aol

See also the README at: https://github.com/intridea/omniauth
