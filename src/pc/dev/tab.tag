<tab>
    <ul>
        <li each={ data } onclick={ parent.toggle } class={ active: parent.currentIndex==index }>{ title }</li>
    </ul>
    <div class="tab-content" riot-tag="tab-content"></div>

    var self = this
    var config = self.opts.opts || self.opts;

    self.data = config.data;
    if (self.data.length > 0) {
        self.currentIndex = 0;
        self.content = self.data[0].content;
        for (i = 0; i < self.data.length; i++) {
            self.data[i].index = i;
        }
    }
    

    toggle(e) {
        self.content = e.item.content;
        self.currentIndex = e.item.index;
        self.update();
    }
</tab>

<tab-content>
    var self = this;
   
    self.parent.on('update', function() {
        self.root.innerHTML = self.parent.content;
    });
</tab-content>