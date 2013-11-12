guard :shell do
  watch('Gemfile') do |m|
    title = 'Bundler'
    msg = `bundle`
    status = ($?.success? && :success) || :failed

    n msg, title, status
    "-> #{msg}"
  end

  watch(/\.hs/) do |m|
    title = 'Build'
    msg = `make`
    status = ($?.success? && :success) || :failed

    n msg, title, status
    "-> #{msg}"
  end
end
