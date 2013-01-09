describe "app.FibsForm", ->
  Given -> @subject = new app.FibsForm

  Given -> @$index = affix('input[name=index]')
  Given -> @$button = affix('button.calculate')
  Given -> @$result = affix('.result')

  describe "#bindEvents", ->
    Given -> spyOn(@subject, 'calculate')
    Given -> @subject.bindEvents()
    When -> @$button.trigger('click')
    Then -> expect(@subject.calculate).toHaveBeenCalled()

  describe "#calculate", ->
    Given -> spyOn($, 'ajax')
    Given -> @event = preventDefault: jasmine.createSpy()
    Given -> @$index.val("5")
    When -> @subject.calculate(@event)

    Then -> expect(@event.preventDefault).toHaveBeenCalled()
    Then -> expect($.ajax).toHaveBeenCalledWith
      type: "post",
      url: "/fibonacci",
      data:
        index: 5
      success: @subject.renderResult

  describe "#renderResult", ->
    When -> @subject.renderResult(9)
    Then -> @$result.text() == "9"


