# debounce a function
debounce = (func, wait = 500, immediate = true)->
  timeout = null
  return ()->
    context = @
    args = arguments
    later = ()->
      timeout = null
      func.apply(context, args) if !immediate
    callNow = immediate && !timeout
    clearTimeout timeout
    timeout = setTimeout later, wait
    func.apply(context, args) if callNow

export {
  debounce
}
