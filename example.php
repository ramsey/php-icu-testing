<?php

$formatter = new MessageFormatter(
    'en-US',
    'The amount is {0, number, ::currency/USD .00/w}',
);

echo $formatter->format([1234]) . PHP_EOL;
