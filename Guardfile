guard :shell do
  watch(/\.hs/) do |m|
    title = 'Build'
    msg = `make`
    status = ($?.success? && :success) || :failed

    n msg, title, status
    "-> #{msg}"
  end
end
